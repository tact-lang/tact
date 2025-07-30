struct ContainsAddress {
    a: Address;
}

contract TestContract {
    s: ContainsAddress;
    
    init() {
        self.s = ContainsAddress{a: myAddress()};
    }
}