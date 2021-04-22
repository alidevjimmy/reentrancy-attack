const EtherStore = artifacts.require('./EtherStore.sol')
const Attack = artifacts.require('./Attack.sol')

module.exports = function(deployer) {
  deployer
    .deploy(EtherStore)
    .then(() =>
      deployer.deploy(Attack, EtherStore.address)
    )
}