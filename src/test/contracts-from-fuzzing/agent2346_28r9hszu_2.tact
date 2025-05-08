struct NestedInner {
    foo: Int;
    bar: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
    message: String;
}

contract DeepStructTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{ foo: 10, bar: true },
            flag: false,
            message: "hello"
        };
    }
}