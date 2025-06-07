struct AddrMix {
    mainAddr: Address;
    backupAddr: Address?;
}

contract AddressVariants {
    data: AddrMix;

    init() {
        self.data = AddrMix{
            mainAddr: myAddress(),
            backupAddr: null,
        };
    }
}