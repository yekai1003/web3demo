pragma solidity^0.5.0;

contract ping {
    string myMsg="pong2";
    function setMsg(string memory _msg) public {
        myMsg = _msg;
    }
    function getMsg() public view returns (string memory) {
        return myMsg;
    }
}

