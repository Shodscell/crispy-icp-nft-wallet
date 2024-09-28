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



import Principal "mo:base/Principal";
import NFTStorage "canister:nft_storage";  // Impor aktor penyimpanan NFT

actor NFTWallet {

    // Fungsi mint NFT yang menambahkan NFT ke storage
    public func mintNFT(nftId: Text, metadata: Text) : async Bool {
        let owner = Principal.fromText("replace-with-owner-principal");
        let success = await NFTStorage.addNFT(nftId, metadata, owner);
        return success;
    };

    // Fungsi untuk menampilkan koleksi NFT dari storage
    public query func getNFTCollection() : async [NFTStorage.NFT] {
        return await NFTStorage.getNFTs();
    };

    // Fungsi untuk mentransfer NFT dengan mengupdate data owner
    public func transferNFT(nftId: Text, receiver: Principal) : async Bool {
        let success = await NFTStorage.transferNFT(nftId, receiver);
        return success;
    };
};

