struct Inner {
    a: Int? as uint16;
    b: Bool?;
    c: String?;
}

struct Outer {
    x: Int as uint32;
    y: Inner;
}

contract TestContract {
    nested: Outer;
    init() {
        self.nested = Outer{
            x: 123,
            y: Inner{
                a: null,
                b: null,
                c: null
            }
        };
    }
}