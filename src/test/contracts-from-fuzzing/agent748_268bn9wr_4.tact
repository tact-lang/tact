struct Inner {
    v: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract DeepNestedStructField {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                v: 999,
                b: false,
            },
            label: "deep",
        };
    }
}
