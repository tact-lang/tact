struct OptionalAddresses {
    add1: Address?;
    add2: Address?;
    add3: Address?;
}

contract OptionAddrContract {
    val: OptionalAddresses;

    init() {
        self.val = OptionalAddresses{ add1: null, add2: null, add3: null };
    }
}