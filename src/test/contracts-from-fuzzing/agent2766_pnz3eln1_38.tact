struct WalletData {
    mainBalance: Int as coins;
    dustBalance: Int as coins;
    owner: Address?;
}

contract WalletState {
    data: WalletData;

    init() {
        self.data = WalletData{
            mainBalance: ton("5"),
            dustBalance: ton("0.001"),
            owner: null,
        };
    }
}