struct Addresses {
    a1: Address;
    a2: Address?;
}

contract AddrTest {
    data: Addresses;

    init() {
        self.data = Addresses{
            a1: myAddress(),
            a2: null,
        };
    }
}