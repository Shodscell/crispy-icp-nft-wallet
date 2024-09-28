import { Actor, HttpAgent } from "@dfinity/agent";
import { idlFactory as nft_wallet_idl } from "../../declarations/nft_wallet"; // Sesuaikan path ini dengan hasil dfx deploy

// Canister ID dari nft_wallet
const CANISTER_ID = "replace-with-nft-wallet-canister-id";

// Membuat agen dan aktor untuk berkomunikasi dengan canister backend
const agent = new HttpAgent();
const nftWallet = Actor.createActor(nft_wallet_idl, { agent, canisterId: CANISTER_ID });

async function mintNFT() {
  const nftId = document.getElementById("nft-id").value;
  const metadata = document.getElementById("nft-metadata").value;
  const result = await nftWallet.mintNFT(nftId, metadata);
  alert(result ? "NFT minted successfully!" : "Failed to mint NFT.");
  loadNFTs();
}

async function transferNFT() {
  const nftId = document.getElementById("transfer-nft-id").value;
  const principal = document.getElementById("transfer-principal").value;
  const result = await nftWallet.transferNFT(nftId, principal);
  alert(result ? "NFT transferred successfully!" : "Failed to transfer NFT.");
  loadNFTs();
}

async function loadNFTs() {
  const nfts = await nftWallet.getNFTCollection();
  const nftList = document.getElementById("nft-list");
  nftList.innerHTML = nfts.map(nft => `<p>ID: ${nft.id}, Metadata: ${nft.metadata}, Owner: ${nft.owner}</p>`).join("");
}

// Event listeners untuk tombol
document.getElementById("mint-button").addEventListener("click", mintNFT);
document.getElementById("transfer-button").addEventListener("click", transferNFT);

// Load NFT collection on page load
window.onload = loadNFTs;
