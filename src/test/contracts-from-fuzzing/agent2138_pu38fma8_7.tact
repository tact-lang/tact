struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract TopLevelOpt {
    nested: OptionalStruct?;
    val: Int;

    init() {
        self.nested = OptionalStruct{
            a: 1,
            b: true,
        };
        self.val = 42;
    }
}