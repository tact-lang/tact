struct OptionalsStruct {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: String?;
}

contract OptionalNestedFields {
    optStruct: OptionalsStruct;

    init() {
        self.optStruct = OptionalsStruct{
            i: null,
            b: null,
            a: null,
            c: null,
            s: null
        };
    }
}