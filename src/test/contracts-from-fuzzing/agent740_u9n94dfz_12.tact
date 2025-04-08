struct HasAddress {
    who: Address;
    optionalWho: Address?;
}

contract AddrStructContract {
    addrData: HasAddress;

    init() {
        self.addrData = HasAddress{
            who: myAddress(),
            optionalWho: null,
        };
    }
}