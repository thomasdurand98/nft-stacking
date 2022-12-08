pragma solidity ^0.8.17;

import "./NftContract.sol";

contract NftStackingContract {
    struct Stacking {
        uint256 tokenId;
        uint256 startStackTime;
        address owner;
    }
    uint256 public totalNftStacked;
    mapping(uint256 => Stacking) public stackingMap;
    NftContract nft;

    constructor(NftContract _nft) {
        nft = _nft;
    }

    function stackNfts(uint256[] calldata tokenIds) public {
        for (uint i = 0; i < tokenIds.length; i++) {
            require(nft.ownerOf(tokenIds[i]) == msg.sender, "you're not the owner of this nft");
            require(stackingMap[tokenIds[i]].startStackTime == 0, "nft already stacked");
            nft.transferFrom(msg.sender, address(this), tokenIds[i]);
            stackingMap[tokenIds[i]].tokenId == tokenIds[i];
            stackingMap[tokenIds[i]].startStackTime == block.timestamp;
            stackingMap[tokenIds[i]].owner == msg.sender;
        }
    }
}