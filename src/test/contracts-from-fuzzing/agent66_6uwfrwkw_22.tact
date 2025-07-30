struct Inner {
    x: Int;
}

struct Outer {
    inr: Inner;
    y: Int;
}

contract NestedMixed {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{ x: 1 },
            y: 2
        };
    }
}