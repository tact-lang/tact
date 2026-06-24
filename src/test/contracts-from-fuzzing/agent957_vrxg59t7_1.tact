struct NestedInner {
    val: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    text: String;
    number: Int?;
}

contract DeepNestedExample {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val: 123,
                flag: true,
            },
            text: "hello",
            number: null,
        };
    }
}