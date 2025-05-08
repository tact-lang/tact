struct Inner {
    subfield: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
}

contract DoubleNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ subfield: 11 },
            nested2: Inner{ subfield: 22 }
        };
    }
}