struct NestedInner {
    number: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    message: String;
}

contract NestedStructTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                number: 7,
                flag: false,
            },
            message: "hello",
        };
    }
}