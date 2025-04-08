struct ManyPrimitives {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    addr1: Address;
    addr2: Address;
    c1: Cell;
    sl1: Slice;
    s1: String;
    s2: String;
}

contract Test {
    mp: ManyPrimitives;
    init() {
        self.mp = ManyPrimitives{
            i1: 1, i2: 2, i3: 3,
            b1: true, b2: false, b3: true,
            addr1: myAddress(), addr2: myAddress(),
            c1: emptyCell(), sl1: emptyCell().asSlice(),
            s1: "hello", s2: "world"
        };
    }
}