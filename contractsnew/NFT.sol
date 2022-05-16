pragma solidity ^0.8.0;
import "./DaughterContract.sol";
import "./DaughterContract2.sol";



contract MomContract {
 uint public spot = 0;
 address [] public NFTcontracts721;
 address [] public NFTcontracts1155;
 string public name;
 uint public age;
 DaughterContract public daughter;
 DaughterContract2 public daughter2;
 uint initialMint = 0;
 constructor(
 )
  public
 {
     name= "NFT contract";
 }

 function createNewNFT721(
  string memory _daughtersName,
  string memory _daughtersSybmol,
  uint8 _daughterDecimals,
  uint _daughtSupply
 )public returns (bool success){

  daughter = new DaughterContract(_daughtersName, _daughtersSybmol, _daughterDecimals, _daughtSupply, msg.sender, 1000);
  NFTcontracts721.push(address(daughter));

    return true;
 }
 function createNewNFT1155(
  string memory _daughtersName,
  string memory _daughtersSybmol,
  uint8 _daughterDecimals,
  uint _daughtSupply
 )public returns (bool success){

  daughter2 = new DaughterContract2(_daughtersName, _daughtersSybmol, _daughterDecimals, _daughtSupply , msg.sender);
  NFTcontracts1155.push(address(daughter));

    return true;
 }
}
