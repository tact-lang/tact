struct NestedStructWithDefaults {
    foo: Int = 111;
    inner: Inner = Inner{ bar: 222, baz: "hi" };
}

struct Inner {
    bar: Int;
    baz: String;
}

contract TestNestedDefaults {
    data: NestedStructWithDefaults;
    init() {
        self.data = NestedStructWithDefaults{};
    }
}