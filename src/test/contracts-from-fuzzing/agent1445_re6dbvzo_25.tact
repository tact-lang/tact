struct DeepAddress {
    addr: Address;
    desc: String;
}

contract AddressNested {
    data: DeepAddress?;

    init() {
        self.data = DeepAddress{
            addr: myAddress(),
            desc: "description",
        };
    }
}