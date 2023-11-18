// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721.sol";

contract XNFT is ERC721{
    uint private _nextTokenId;
    mapping(address => string) public twitterHandle;

    // 构造函数
    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_){
    }

    //BAYC的baseURI为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/ 
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    }
    
    // 铸造函数，自动递增
    function mint(address to, string calldata handle) external {
        uint tokenId = _nextTokenId++;
        twitterHandle[to] = handle;
        _mint(to, tokenId);
    }

    function nextId() external view returns (uint) {
      return _nextTokenId;
    }

    // twitterHandle[address]
    // ownedTokens[address]
    // tokenTransfer[address]
    // mint(to, handle)
    // transfer(from, to, tokenId)
}