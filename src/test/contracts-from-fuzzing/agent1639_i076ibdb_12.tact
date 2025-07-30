struct WithSuffix {
    a: Int;
    b: Bool?;
    suffix: Slice as remaining;
}

contract TestContract {
    holder: WithSuffix;

    init() {
        self.holder = WithSuffix{
            a: 7,
            b: null,
            suffix: "hello".asComment().asSlice()
        };
    }
}