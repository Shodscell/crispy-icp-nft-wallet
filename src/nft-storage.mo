import Principal "mo:base/Principal";

actor NFTStorage {

    // Struktur untuk menyimpan informasi NFT
    type NFT = {
        id: Text;
        metadata: Text;
        owner: Principal;
    };

    // Stable variable untuk memastikan data tetap ada setelah upgrade
    stable var nftCollection: [NFT] = [];

    // Fungsi untuk menambahkan NFT baru ke penyimpanan
    public func addNFT(nftId: Text, metadata: Text, owner: Principal) : async Bool {
        let newNFT: NFT = {
            id = nftId;
            metadata = metadata;
            owner = owner;
        };

        // Tambahkan NFT baru ke koleksi
        nftCollection := Array.append<NFT>(nftCollection, [newNFT]);
        return true;
    };

    // Fungsi untuk mengambil seluruh koleksi NFT
    public query func getNFTs() : async [NFT] {
        return nftCollection;
    };

    // Fungsi untuk mengupdate pemilik NFT
    public func transferNFT(nftId: Text, newOwner: Principal) : async Bool {
        let nftIndex = Array.findIndex<NFT>(nftCollection, func(nft) { nft.id == nftId });

        if (nftIndex != null) {
            // Update pemilik NFT yang ditemukan
            nftCollection[nftIndex] := {
                id = nftCollection[nftIndex].id;
                metadata = nftCollection[nftIndex].metadata;
                owner = newOwner;
            };
            return true;
        } else {
            return false;
        }
    };

    // Fungsi untuk mengambil NFT berdasarkan ID
    public query func getNFTById(nftId: Text) : async ?NFT {
        let nftIndex = Array.findIndex<NFT>(nftCollection, func(nft) { nft.id == nftId });

        if (nftIndex != null) {
            return ?nftCollection[nftIndex];
        } else {
            return null;
        }
    };
};
￼Enter
