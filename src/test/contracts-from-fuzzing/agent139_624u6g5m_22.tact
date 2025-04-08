struct Inner {
    foo: Int? = null;
}

struct Outer {
    p: Inner = Inner{};
}

contract DefaultNestedOpt {
    val: Outer = Outer{};

    init() {
        self.val = Outer{ p: Inner{ foo: 7 } };
    }
}