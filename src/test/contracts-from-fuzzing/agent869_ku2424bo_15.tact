struct AddressNested {
    a: Address;
    b: Address?;
    c: String;
}

struct OuterAddr {
    inner: AddressNested;
    desc: String;
}

contract AddressTest {
    addrData: OuterAddr;

    init() {
        self.addrData = OuterAddr{
            inner: AddressNested{
                a: myAddress(),
                b: null,
                c: "hi",
            },
            desc: "test",
        };
    }

    receive() {}
}
