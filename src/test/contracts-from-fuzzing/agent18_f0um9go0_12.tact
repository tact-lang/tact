struct Inner {
    val: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nestedOpt: Inner?;
}

contract MultipleNested {
    all: Outer;
    init() {
        self.all = Outer{
            nested1: Inner{ val: 1 },
            nested2: Inner{ val: 2 },
            nestedOpt: null
        };
    }
}
