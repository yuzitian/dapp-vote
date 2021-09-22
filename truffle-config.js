var HDWalletProvider = require("truffle-hdwallet-provider");

// infura 注册后获取的api-key
// var infura_apikey = "548f55b9fe4a4beabbeddf8d1de7cce9";

// 接下来，提供助记词（mnemonic）来生成你的账户。 進入 MetaMask -> Settings -> reveal seed words 复制到这里
//警告 ：在此过程中，我们强烈建议将助记符存储在另一个（秘密）文件中，以降低助记符泄漏风险。 如果有人知道你的助记符，他们将拥有你所有的地址和私钥！我这个地址是测试地址，没有主网的ETH代币，所以无所谓！

var mnemonic = "now toy use yard ostrich assist chronic unknown ship embark jungle glare";

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    private: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/548f55b9fe4a4beabbeddf8d1de7cce9"),
      network_id: 3,
      gas: 3012388,
      gasPrice: 30000000000
    },
    main: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/548f55b9fe4a4beabbeddf8d1de7cce9"),
      network_id: 3,
      gas: 3012388,
      gasPrice: 1000000000
    }
  }
};
