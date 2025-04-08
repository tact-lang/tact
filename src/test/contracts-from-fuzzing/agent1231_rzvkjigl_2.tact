struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    val: Int;
    opt: Int?;
}

contract TestContract {
    nested: Nested = Nested{inner: Inner{val: 1, opt: null}, flag: true};

    init() {
        self.nested = Nested{inner: Inner{val: 2, opt: 3}, flag: false};
    }
}
