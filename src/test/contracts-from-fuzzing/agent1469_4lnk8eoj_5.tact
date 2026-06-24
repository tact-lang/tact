struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract StructWithOptionals {
    field: OptionalsInStruct;

    init() {
        self.field = OptionalsInStruct{
            a: 1,
            b: null,
            c: null,
            d: true,
        };
    }
}