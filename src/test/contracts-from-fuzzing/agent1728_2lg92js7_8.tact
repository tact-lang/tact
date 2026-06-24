struct OptionalDeepNested {
    sub: Int?;
    text: String;
}

contract OptionalInNestedStruct {
    val: OptionalDeepNested;

    init() {
        self.val = OptionalDeepNested{
            sub: null,
            text: "deepopt",
        };
    }
}