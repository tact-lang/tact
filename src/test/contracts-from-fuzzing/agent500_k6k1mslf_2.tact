struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepNested {
    val: Outer;

    init() {
        self.val = Outer{ inner: Inner{ value: 123 } };
    }
}