contract NestedStructContract {
    record1: Inner1;

    init() {
        self.record1 = Inner1{ nested: Inner2{ val: 11 }, foo: 22 };
    }
}

struct Inner1 {
    nested: Inner2;
    foo: Int;
}

struct Inner2 {
    val: Int;
}
