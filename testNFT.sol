//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract simpleNFT is ERC721, Ownable {

    uint public totalSupply;
    uint public maxSupply;
    string public baseURL;

constructor(string memory enteredURL, uint max) ERC721("AIPicturesNFT", "NFT"){

    maxSupply = max;
    baseURL = enteredURL;
}

function _baseURI() internal view override returns (string memory){
    return baseURL;
}

function safeMint(address to) public onlyOwner{
    require(maxSupply >totalSupply, "Already minted Max");
    uint tokenId = totalSupply;
    totalSupply += 1;
    _mint(to, tokenId);

}
}