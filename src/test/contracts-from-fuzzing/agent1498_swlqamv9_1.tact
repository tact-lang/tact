struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract DeepNested {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{ a: 1, b: true },
            flag: false,
        };
    }
}