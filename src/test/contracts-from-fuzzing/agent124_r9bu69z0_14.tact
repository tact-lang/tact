struct Inner {
    val: Int;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract MultiNested {
    field: Outer;
    init() {
        self.field = Outer{
            one: Inner{ val: 1 },
            two: Inner{ val: 2 },
            three: Inner{ val: 3 }
        };
    }
}