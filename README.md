# dapp-vote
dapp构建流程：
1.创建文件夹 执行truffle init 安装npm install truffle-hdwallet-provider
2.打开contract文件夹放入sol文件
打开migrate文件夹放入部署文件
重新配置truffle-config.js文件
3.执行编译部署
truffle compile
truffle migrate --network ropsten
保存合约地址
4.新建app文件夹
npm install lite-server
npm install web3
放入jquery web3js和abi文件
