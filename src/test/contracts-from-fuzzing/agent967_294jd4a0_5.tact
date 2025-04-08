struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct WithDeepOptional {
    nested: NestedOptional?;
    val: String;
}

contract OptionalInStruct {
    data: WithDeepOptional;

    init() {
        self.data = WithDeepOptional{
            nested: null,
            val: "hi"
        };
    }
}