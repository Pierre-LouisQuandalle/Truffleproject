var Mytoken = artifacts.require("Mytoken");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(Mytoken);
};