struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    message: String;
}

contract NestedStructContract {
    field: NestedOuter;

    init() {
        self.field = NestedOuter{
            inner: NestedInner{
                a: 10,
                b: null
            },
            message: "hello"
        };
    }
}