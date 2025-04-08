struct HasAddressAndOpt {
    owner: Address;
    maybeOwner: Address?;
}

contract AddressCombination {
    data: HasAddressAndOpt;

    init() {
        self.data = HasAddressAndOpt{
            owner: myAddress(),
            maybeOwner: null
        };
    }
}
