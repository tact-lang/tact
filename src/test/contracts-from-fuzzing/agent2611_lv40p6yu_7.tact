struct Inner {
    value: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
}

contract MultiNested {
    content: Outer;

    init() {
        self.content = Outer{
            nested1: Inner{ value: 1 },
            nested2: Inner{ value: 2 }
        };
    }
}