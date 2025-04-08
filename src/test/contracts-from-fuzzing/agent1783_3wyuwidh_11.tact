struct AddressVariants {
    primary: Address;
    backup: Address?;
}

contract StructAddrOpts {
    wallets: AddressVariants;
    init() {
        self.wallets = AddressVariants{
            primary: myAddress(),
            backup: null,
        };
    }
}