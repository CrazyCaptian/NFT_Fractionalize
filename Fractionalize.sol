pragma solidity ^0.8.0;
import "./DaughterContract.sol";
contract MomContract {
 uint public spot = 0;
 address [] public NFTcontracts;
 string public name;
 uint public age;
 DaughterContract public daughter;
 uint initialMint = 0;
 constructor(
 )
  public
 {
     name= "NFT contract";
 }

 function createNewNFT(
  string memory _daughtersName,
  string memory _daughtersSybmol,
  uint8 _daughterDecimals,
  uint _daughtSupply
 )public returns (bool success){

  daughter = new DaughterContract(_daughtersName, _daughtersSybmol, _daughterDecimals, _daughtSupply);
  NFTcontracts.push(address(daughter));

    return true;
 }

}
