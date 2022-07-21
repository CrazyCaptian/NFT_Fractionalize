pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForgeDistributorContract {

	uint public totalMax = 12;
	uint public totalAmt = 0;
	uint public totalAmtKiwi = 0;
    uint public totalTimesForge = 0;
    uint public timestamp = block.timestamp;
    uint public timestampKiwi = block.timestamp;
    uint public length = 60 * 5;
    uint public ForgePer = 0;
    uint public KiwiPer = 0;
    address public forgeContract = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    address public kiwiContract = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    address public NFTFractionalizedContract  = 0xF44fB43066F7ECC91058E3A614Fb8A15A2735276;
    
    
    constructor() public {

    }
    
    
    function mintTWO() external{
         require(timestamp < block.timestamp && timestampKiwi < block.timestamp, "Timestamp must be less than current block");
	mintForge();
	mintKiwi();
	
	}
		
    function mintKiwi() external {
        require(timestampKiwi < block.timestamp, "Timestamp must be less than current block");
	require(totalTimesForge<totalMax, "Deposit to continue"){
	timestampKiwi = block.timestamp + length;
	totalTimesKiwi = totalTimes + 1;
        ERC20(kiwicontract).transfer(forgecontract, KiwiPer);
	totalAmtKiwi = totalAmtKiwi - (totalAmtKiwi / 12);
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
    }
    
    
    function mintForge() external {
       require(timestamp < block.timestamp, "Timestamp must be less than current block");
	require(totalTimesForge<totalMax){
        timestamp = block.timestamp + length;
        totalTimesForge = totalTimes + 1;
        ERC20(NFTFractionalizedContract).transfer(forgecontract, ForgePer);
        ERC20(kiwicontract).transfer(forgecontract, KiwiPer);
    	totalAmt = totalAmt - (totalAmt / totalMax);
	totalAmtKiwi = totalAmtKiwi - (totalAmtKiwi / totalMax);
	
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
	
    }    
    
    
    function deposit(uint256 _amount) external {
        ERC20(NFTFractionalizedContract).transferFrom(msg.sender, forgecontract, _amount);
	require(totalAMT > _amount,"Only if you add more");
        totalAmt = totalAmt + _amount;
	ForgePer = ERC20(NFTFractionalizedContract).balanceOf(Address(this)) / 12;
	
        // transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        
            totalTimesForge = 0;
    }    
    
    
    function depositKiwi(uint256 _amount) external {{
        ERC20(kiwiContract).transferFrom(msg.sender, address(this), _amount);
	require(totalAmtKiwi > _amount,"Only if you add more");
        totalAmtKiwi = totalAmtKiwi + _amount;
	KiwiPer = ERC20(KiwiContract).balanceOf(Address(this)) / totalMax;
        
	// transfer the token from address of this contract
        // to address of the user (executing the withdrawToken() function)
        
            totalTimesKiwi = 0;
    }
}
