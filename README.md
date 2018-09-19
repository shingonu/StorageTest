# StorageTest

onther seminar

```cmd
> truffle migrate --reset
> truffle console
```

in truffle console:

```javascript
let contract
StorageTest.new().then(instance => contract = instance)

web3.eth.getStorageAt(contract.address, 0)
// '0x0f'

web3.eth.getStorageAt(contract.address, 1)
// '0x1000000020000000000000004000000000000000000000000000000080'

web3.eth.getStorageAt(contract.address, 2)
// '0x7365636f6e646279746573313600000066697273746279746573313600000000'

web3.eth.getStorageAt(contract.address, 3)
// '0x6279746573333200000000000000000000000000000000000000000000000000'

web3.eth.getStorageAt(contract.address, 4)
// '0x6c65747320737472696e6720736f6d657468696e67000000000000000000002a'

web3.eth.getStorageAt(contract.address, 5)
// '0x6c65747320627974657320736f6d657468696e67000000000000000000000028'

web3.eth.getStorageAt(contract.address, 6)
// '0x0'

web3.eth.getStorageAt(contract.address, 7)
// '0x0'

web3.eth.getStorageAt(contract.address, 8)
// '0x02'

web3.eth.getStorageAt(contract.address, 9)
// '0x02'

web3.eth.getStorageAt(contract.address, 10)
// '0x0169'

// mapping
index = '0000000000000000000000000000000000000000000000000000000000000006'
key = '000000000000000000000000bccc714d56bc0da0fd33d96d2a87b680dd6d0df6'
newKey = web3.sha3(key + index, {encoding: 'hex'})
web3.eth.getStorageAt(contract.address, newKey)
// '0x58'

// array
index = '0000000000000000000000000000000000000000000000000000000000000008'
newKey = web3.sha3(index, {encoding: 'hex'})
web3.eth.getStorageAt(contract.address, newKey)
// 0x1f40
```
