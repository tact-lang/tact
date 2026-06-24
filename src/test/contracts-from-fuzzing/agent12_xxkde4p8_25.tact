struct Wallet {
    balance: Int as coins;
}

contract TestWallet {
    receive() {
        // Instantiate a Wallet with balance as coins
        let w: Wallet = Wallet { balance: 1000 };
        dump(w.balance); // should dump 1000, serialized as coins
    }
}
