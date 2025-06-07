contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                value: 123,
                flag: true
            },
            description: "desc"
        };
    }
}

struct Outer {
    inner: Inner;
    description: String;
}

struct Inner {
    value: Int;
    flag: Bool;
}