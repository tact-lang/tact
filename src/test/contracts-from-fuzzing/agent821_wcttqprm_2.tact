struct OptionalStruct {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestOptionalFields {
    nestedOpt: OptionalStruct = OptionalStruct{
        a: 11,
        b: null,
        c: null
    };

    init() {
        self.nestedOpt = OptionalStruct{
            a: 22,
            b: true,
            c: "abc"
        };
    }
}
