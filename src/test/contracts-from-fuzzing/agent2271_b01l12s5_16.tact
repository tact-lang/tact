struct OptionalStruct {
    v: Int;
    flag: Bool;
}

contract NullableTop {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            v: 7,
            flag: true,
        };
    }
}