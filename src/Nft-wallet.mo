actor class NFTWallet() = this {
    stable var owner: Principal = Principal.fromText("replace-with-owner-id");
    stable var nftCollection : [Text] = [];

    public func mintNFT(nft: Text) : async Bool {
        if (owner == Principal.fromText("replace-with-owner-id")) {
            nftCollection := Array.append(nftCollection, [nft]);
            return true;
        } else {
            return false;
        }
    };

    public query func getNFTCollection() : async [Text] {
        return nftCollection;
    };

    public func transferNFT(receiver: Principal, nft: Text) : async Bool {
        if (Array.find(nftCollection, func(x) {x == nft}) != null) {
            nftCollection := Array.filter(nftCollection, func(x) {x != nft});
            // In reality, we'd send this NFT to the receiver canister
            return true;
        } else {
            return false;
        }
    };
};
