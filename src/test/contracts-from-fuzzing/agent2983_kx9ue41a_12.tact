struct StructOfOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract OptionalStructField {
    optStruct: StructOfOptionals;

    init() {
        self.optStruct = StructOfOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}