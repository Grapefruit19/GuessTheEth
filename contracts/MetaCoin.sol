pragma solidity ^0.4.4;

// import "./ConvertLib.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
	address owner;

	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function MetaCoin(address caller) {
		owner = caller;
		balances[caller] = 10000;
	}

	function coinsOwned() returns(uint){
		return balances[this];
	}

	function getOwner() returns(address){
		return owner;
	}

	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

}
