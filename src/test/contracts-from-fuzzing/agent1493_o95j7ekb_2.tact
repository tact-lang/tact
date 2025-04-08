struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer {
            inner: Inner { val: 42 },
            flag: true
        };
    }
}
