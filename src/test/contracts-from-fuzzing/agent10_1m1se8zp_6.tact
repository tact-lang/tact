struct Inner {
    x: Int;
}

struct Mid {
    val: Int;
    nested: Inner;
}

struct Outer {
    valOuter: Int;
    mid: Mid;
}

contract MultiNested {
    field: Outer;
    init() {
        self.field = Outer{
            valOuter: 1,
            mid: Mid{
                val: 2,
                nested: Inner{
                    x: 3,
                },
            },
        };
    }
}
