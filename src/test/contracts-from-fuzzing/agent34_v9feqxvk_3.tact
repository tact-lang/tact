struct Inner {
    x: Int;
}

struct Outer {
    y: Int;
    nested: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            y: 5,
            nested: Inner{ x: 3 }
        };
    }
}