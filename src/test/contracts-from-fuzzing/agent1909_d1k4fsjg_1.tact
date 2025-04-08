struct MultiOptionalInner {
    flag: Bool?;
    count: Int?;
}

struct Outer {
    text: String;
    inner: MultiOptionalInner?;
}

contract OptionalNestedStructs {
    container: Outer;

    init() {
        self.container = Outer{
            text: "abc",
            inner: null
        };
    }
}