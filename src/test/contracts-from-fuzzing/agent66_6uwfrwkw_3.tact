struct OptNested {
    foo: Int?;
    bar: Int?;
}

contract OptionalStruct {
    val: OptNested;

    init() {
        self.val = OptNested{
            foo: null,
            bar: 42
        };
    }
}