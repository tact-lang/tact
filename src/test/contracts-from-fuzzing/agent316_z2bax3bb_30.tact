struct Inner {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
}

struct Outer {
    nested: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                a: 1,
                b: 2,
                c: 3
            }
        };
    }
}
