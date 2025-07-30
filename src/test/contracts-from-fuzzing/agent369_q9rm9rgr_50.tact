struct ContainsAddress {
    a: Address;
    optAddr: Address?;
}

contract TestContract {
    data: ContainsAddress;

    init() {
        self.data = ContainsAddress{
            a: myAddress(),
            optAddr: null
        };
    }
}