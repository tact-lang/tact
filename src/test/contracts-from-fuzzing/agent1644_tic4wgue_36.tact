struct WalletInfo {
    owner: Address?;
    backup: Address?;
}

contract HasOptAddr {
    info: WalletInfo = WalletInfo {
        owner: null,
        backup: null
    };

    init() {}
}