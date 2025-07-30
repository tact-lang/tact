struct OptionalInNested {
    inner: InnerOpt;
    val: Int;
}

struct InnerOpt {
    flag: Bool?;
    message: String;
}

contract OptionalInNestedStructs {
    s: OptionalInNested;

    init() {
        self.s = OptionalInNested{
            inner: InnerOpt{
                flag: null,
                message: "hello",
            },
            val: 42,
        };
    }
}