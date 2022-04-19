const AidBondToken = artifacts.require("AidBondToken");

module.exports = async function (deployer) {
  await deployer.deploy(AidBondToken, "AidBond", "ABND", 210000000, 18);
};
