struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DoubleNestedStruct {
    both: Outer;

    init() {
        self.both = Outer{
            first: Inner{ x: 1, y: true },
            second: Inner{ x: 2, y: false }
        };
    }
}