struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    number: Int;
}

contract DeepNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{ val: 55 },
            number: 77
        };
    }
}