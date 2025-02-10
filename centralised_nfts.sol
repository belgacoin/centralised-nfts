// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract WatergunsV5 is ERC721URIStorage, Ownable {
    uint256 public currentTokenId;

// Edit Max Supply below
    uint256 public constant MAX_SUPPLY = 8;
    string public baseTokenURI;

    event NFTMinted(address indexed recipient, uint256 tokenId, string tokenURI);

// Edit your domain name
    constructor(string memory name, string memory symbol) ERC721(name, symbol) Ownable(msg.sender) {
        baseTokenURI = "https://YOURDOMAIN.COM/json/";
    }

    function mint(address recipient) external onlyOwner {
        require(recipient != address(0), "Recipient cannot be zero address");
        require(currentTokenId < MAX_SUPPLY, "Maximum supply reached");

        uint256 newTokenId = ++currentTokenId;
        _safeMint(recipient, newTokenId);

        string memory tokenURI = string(abi.encodePacked(Strings.toString(newTokenId), ".json"));
        _setTokenURI(newTokenId, tokenURI);

        emit NFTMinted(recipient, newTokenId, tokenURI);
    }

    function setBaseTokenURI(string memory newBaseURI) external onlyOwner {
        require(bytes(newBaseURI).length > 0, "Base URI cannot be empty");
        baseTokenURI = newBaseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}
