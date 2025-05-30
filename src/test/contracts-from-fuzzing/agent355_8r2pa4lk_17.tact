struct Inner {
    x: Int;
}

struct Outer {
    field: Inner?;
}

contract OptionalNest {
    s: Outer;

    init() {
        self.s = Outer{
            field: Inner{ x: 100 }
        };
    }
}