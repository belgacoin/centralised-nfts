# centralised-nfts

A smart contract template for NFT's with centralised hosting.

Prerequisites

1) Hosting server (e.g. LAMP); 
2) Attach fixed IP to your server;
3) Attach domain name to your IP;
4) Attach Certificate (e.g. Certbot) to your server (not a self-signed cert);
5) Compile, Deploy and Mint in Remix;

In my example, the necessary JSON files (one per image) are stored in the JSON folder, while the images are stored in the IMAGES folder. Each JSON file links to an image with the same name, e.g., 1.json corresponds to 1.png.

Folder structure in my example:

/ (Server Root)
│── index.html
│── json/
│   ├── 1.json
│   ├── 2.json
│   ├── 3.json
│   ├── 4.json
│   ├── 5.json
│   ├── 6.json
│   ├── 7.json
│   ├── 8.json
│── images/
│   ├── 1.png
│   ├── 2.png
│   ├── 3.png
│   ├── 4.png
│   ├── 5.png
│   ├── 6.png
│   ├── 7.png
│   ├── 8.png

index.html → Main webpage (optional but recommended).
json/ folder → Contains metadata JSON files (1.json, 2.json, etc.).
images/ folder → Contains image files (1.png, 2.png, etc.).
