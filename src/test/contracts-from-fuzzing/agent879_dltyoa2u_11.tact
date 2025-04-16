struct SerialOrder {
    a: Int as uint4;
    b: Int as int12;
    c: Int as uint20;
    d: Int as int32;
    e: Int as uint64;
}

contract SerialOrderTest {
    s: SerialOrder;
    init() {
        self.s = SerialOrder{ a:1, b:2, c:3, d:4, e:5 };
    }
}
