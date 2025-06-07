struct Inner {
    x: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract MultipleNested {
    field: Outer;

    init() {
        self.field = Outer{
            inner1: Inner{x: 1},
            inner2: Inner{x: 2},
        };
    }
}