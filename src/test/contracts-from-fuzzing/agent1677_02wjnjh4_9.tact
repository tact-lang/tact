struct OptionalStringNested {
    title: String?;
    desc: String?;
    count: Int;
}

contract TestOptionalStringNested {
    val: OptionalStringNested = OptionalStringNested{
        title: null, desc: null, count: 0
    };

    init() {
        self.val = OptionalStringNested{
            title: "Hello",
            desc: "World",
            count: 123
        };
    }
}
