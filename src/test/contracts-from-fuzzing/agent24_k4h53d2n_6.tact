struct OptionalNested {
    inner: OptionalInner?;
    flag: Bool;
}

struct OptionalInner {
    val: Int;
    text: String;
}

contract OptionalNestedStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: OptionalInner{
                val: 12,
                text: "abc",
            },
            flag: true,
        };
    }
}