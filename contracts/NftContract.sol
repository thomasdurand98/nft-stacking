pragma solidity ^0.8.17;

import "erc721a/contracts/ERC721A.sol";

contract NftContract is ERC721A {
    constructor() ERC721A("Stacking NFT", "SNFT") {}

    function mint(uint256 _quant) public {
        _safeMint(msg.sender, _quant);
    }
}