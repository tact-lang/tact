struct Addresses {
    main: Address;
    secondary: Address?;
}

contract AddrCombos {
    some: Addresses;
    init() {
        self.some = Addresses{
            main: myAddress(),
            secondary: null
        };
    }
}
