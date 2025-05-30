struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    extra: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{a: 1, b: false},
            extra: "hi",
        };
    }
}