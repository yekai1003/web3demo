# web3demo

## 智能合约 ping.sol

``` javascript
pragma solidity^0.4.24;

contract ping {
    string myMsg="pong2";
    function setMsg(string _msg) public {
        myMsg = _msg;
    }
    function getMsg() public view returns (string) {
        return myMsg;
    }
}
```

## web3 调用

```
<script>
         //abi代码定义-从合约中拷贝而来
         abi = [
                        {
                           "constant": false,
                           "inputs": [
                              {
                                 "name": "_msg",
                                 "type": "string"
                              }
                           ],
                           "name": "setMsg",
                           "outputs": [],
                           "payable": false,
                           "stateMutability": "nonpayable",
                           "type": "function"
                        },
                        {
                           "constant": true,
                           "inputs": [],
                           "name": "getMsg",
                           "outputs": [
                              {
                                 "name": "",
                                 "type": "string"
                              }
                           ],
                           "payable": false,
                           "stateMutability": "view",
                           "type": "function"
                        }
                     ]
      </script>
      <script>
         //1. 创建web3对象
         var web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
         
         //查看账户信息-测试web3对象是否连接geth成功
         web3.eth.getAccounts(function(err,result){
            console.log(result)
         });
         
         //合约地址-创建合约时获得
         address = "0xaa9dbbcf8e80b9bad333f36e1fb931529056c36d"
         //2. 通过合约地址以及合约的abi获得合约实例
         instance = new web3.eth.Contract(abi, address);
         //3. 调用合约中的方法
         instance.methods.getMsg().call({},function(e,r){
            console.log(e,r)
            document.write("<h1>"+r+"</h1>")
         });
      </script>
```
