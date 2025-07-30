struct SerialOrderTest {
    a: Int as uint16;
    b: Bool;
    c: Int as uint4;
    d: String;
    e: Bool;
    f: Address;
}

contract SerializeOrder {
    s: SerialOrderTest;

    init() {
        self.s = SerialOrderTest{
            a: 42,
            b: true,
            c: 15,
            d: "hi",
            e: false,
            f: myAddress()
        };
    }
}