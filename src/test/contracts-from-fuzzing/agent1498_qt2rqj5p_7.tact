struct OptionalAddress {
    addr: Address?;
    name: String;
}

contract TestContract {
    rec: OptionalAddress;

    init() {
        self.rec = OptionalAddress{
            addr: null,
            name: "Test"
        };
    }
}
