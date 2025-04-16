struct Inner {
    s: String;
}

struct Outer {
    str: String;
    nested: Inner;
}

contract StringsNested {
    data: Outer;
    init() {
        self.data = Outer{ str: "hello", nested: Inner{ s: "world" } };
    }
}