struct Bits {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
    e: Int as uint5;
}

contract BitsTest {
    data: Bits = Bits{ a:1, b:2, c:3, d:4, e:5 };

    init() {
        self.data = Bits{ a:0, b:3, c:7, d:15, e:31 };
    }
}
