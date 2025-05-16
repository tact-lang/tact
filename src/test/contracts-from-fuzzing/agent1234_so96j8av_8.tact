struct Big {
    a: Int;
    b: Bool;
    c: Address;
    d: Int;
    e: Bool;
    f: Address;
    g: Int;
    h: Bool;
    i: Address;
    j: Int;
}

contract BigStructTest {
    data: Big;

    init() {
        self.data = Big{
            a: 1, b: true, c: myAddress(),
            d: 2, e: false, f: myAddress(),
            g: 3, h: true, i: myAddress(),
            j: 4,
        };
    }
}