const StorageTest = artifacts.require("./StorageTest.sol");

module.exports = function(deployer) {
  deployer.deploy(StorageTest);
};
