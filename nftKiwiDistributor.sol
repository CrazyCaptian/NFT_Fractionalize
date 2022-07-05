pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract OwnableAndMods{
    address public owner;
    address [] public moderators;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }
    modifier OnlyModerators() {
    bool isModerator = false;
    for(uint x=0; x< moderators.length; x++){
    	if(moderators[x] == msg.sender){
		isModerator = true;
		}
		}
        require(msg.sender == owner || isModerator, "Ownable: caller is not the owner/mod");
        _;
    }
}


contract forgeDistributeNFT is OwnableAndMods {
	uint public totalAmt = 0;
	uint public totalAmtKiwi = 0;
    uint public totalTimes = 3;
    uint public timestamp = block.timestamp;
    uint public length = 60 * 10;
    address public forgecontract = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    address public kiwicontract = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    address public NFTFractionalizedContract  = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    constructor() public {
    
    }
    function mintToday() external {
       require(timestamp < block.timestamp, "Timestamp must be less than current block");

            timestamp = block.timestamp + length;
            totalTimes = totalTimes + 1;
            ERC20(NFTFractionalizedContract).transfer(forgecontract, totalAmt/totalTimes);
            ERC20(kiwicontract).transfer(forgecontract, totalAmtKiwi/totalTimes);
    
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        
    }    
    function deposit(uint256 _amount) external onlyOwner {
        totalAmt = totalAmt + _amount;
        ERC20(NFTFractionalizedContract).transfer(forgecontract, _amount/totalTimes);
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        
    }    
    function depositKiwi(uint256 _amount) external onlyOwner {
        totalAmtKiwi = totalAmtKiwi + _amount;
        ERC20(kiwicontract).transfer(forgecontract, _amount/totalTimes);
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        
    }
}
