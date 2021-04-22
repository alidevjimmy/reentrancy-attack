pragma solidity >=0.4.22 <0.9.0;

contract EtherStore {

    uint public withdrawalLimit = 1 ether;
    mapping(address => uint) public balances;

    function depositFunds() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds (uint _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw);
        require(_weiToWithdraw <= withdrawalLimit);
        require(msg.sender.call.value(_weiToWithdraw)());
        balances[msg.sender] -= _weiToWithdraw;
    }
    
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
 }