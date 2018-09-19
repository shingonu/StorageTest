pragma solidity ^0.4.24;

contract StorageTest {
  // saved at index 0
	uint storedUint256 = 15; // actually stored value: 0x000000000000000000000000000000000000000000000000000000000000000f
                           // get stored value: 0x0f = 15

  // constant variable is not stored in a storage. available only in code
	uint constant constUint256 = 16;

  // index 1
  // 0x1000000020000000000000004000000000000000000000000000000080: because each of items are packed
  uint128 storedUint128 = uint128(128); // 0x00000000000000000000000000000080: 128bit packed
	uint64 storedUint64 = uint64(64); // 0x0000000000000040: 64bit packed
  uint32 storedUint32 = uint32(32); // 0x00000020: 32bit packed
  uint16 storedUint16 = uint16(16); // 0x10: 16bit packed

  // bytes(string) are left-aligned
  // index 2
	bytes16 firstStoredBytes16 = 'firstbytes16'; // actually stored value: 0x6279746573313600000000000000000000000000000000000000000000000000
  bytes16 secondStoredBytes16 = 'secondbytes16';
                                     // get stored value: 0x62797465733136000000000000000000

  // index 3
	bytes32 storedBytes32 = 'bytes32'; // 0x6279746573333200000000000000000000000000000000000000000000000000

  // index 4
	string storedString = 'lets string something'; // 0x6c65747320737472696e6720736f6d657468696e67000000000000000000002a
                                                 // 2a: length of the stored string
  // index 5
  bytes storedBytes = 'lets bytes something'; // 0x6c65747320627974657320736f6d657468696e67000000000000000000000028
                                              // 28: length of the stored bytes

  // index 6
	mapping (address => uint) storedUintMapping;

	// index 7
	mapping (address => DeviceData) storedStructMapping;

	// index 8
	uint[] stroedUintArray;

	// index 9
	DeviceData[] stroedStructArray;

	// index 10
	// index: 000000000000000000000000000000000000000000000000000000000000000a; not 10
  // not 10
	bytes long_bytes = 'lets bytes somethinglets bytes somethinglets bytes somethinglets bytes somethinglets bytes somethinglets bytes somethinglets bytes somethinglets bytes somethinglets bytes something';

	struct DeviceData {
		string deviceBrand;
		string deviceYear;
		string batteryWearLevel;
	}

	constructor() {
		address address1 = 0xbccc714d56bc0da0fd33d96d2a87b680dd6d0df6;
		address address2 = 0xaee905fdd3ed851e48d22059575b9f4245a82b04;

		// key:   000000000000000000000000bccc714d56bc0da0fd33d96d2a87b680dd6d0df6
		// index: 0000000000000000000000000000000000000000000000000000000000000006
		// newKey = web3.sha3(key + index, {encoding: 'hex'})
		// web3.eth.getStorageAt(storage.address, newKey)
		storedUintMapping[address1] = 88;
		// key:   000000000000000000000000aee905fdd3ed851e48d22059575b9f4245a82b04
		// index: 0000000000000000000000000000000000000000000000000000000000000006
		// newKey = web3.sha3(key + index, {encoding: 'hex'})
		// web3.eth.getStorageAt(storage.address, newKey)
		storedUintMapping[address2] = 99;

		DeviceData memory deviceData1 = DeviceData('deviceBrand', 'deviceYear', 'wearLevel');
		DeviceData memory deviceData2 = DeviceData('deviceBrand2', 'deviceYear2', 'wearLevel2');

		// key:   000000000000000000000000bccc714d56bc0da0fd33d96d2a87b680dd6d0df6
		// index: 0000000000000000000000000000000000000000000000000000000000000007
		// newKey = web3.sha3(key + index, {encoding: 'hex'})
		// web3.eth.getStorageAt(storage.address, newKey)
		storedStructMapping[address1] = deviceData1;
		// key:   000000000000000000000000aee905fdd3ed851e48d22059575b9f4245a82b04
		// index: 0000000000000000000000000000000000000000000000000000000000000007
		storedStructMapping[address2] = deviceData2;

		// index: 0000000000000000000000000000000000000000000000000000000000000008
		// newKey = web3.sha3(index, {encoding: 'hex'})
		stroedUintArray.push(8000);
		stroedUintArray.push(9000);

		// // index: 0000000000000000000000000000000000000000000000000000000000000009
		stroedStructArray.push(deviceData1);
		stroedStructArray.push(deviceData2);
	}
}
