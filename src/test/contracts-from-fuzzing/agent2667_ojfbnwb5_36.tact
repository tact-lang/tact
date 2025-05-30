struct OptionalAddressandInt {
    addr: Address?;
    value: Int?;
}

contract OptionalAddrIntContract {
    d: OptionalAddressandInt;

    init() {
        self.d = OptionalAddressandInt{addr: null, value: null};
    }

    receive() {
        self.d = OptionalAddressandInt{addr: myAddress(), value: 123};
    }
}