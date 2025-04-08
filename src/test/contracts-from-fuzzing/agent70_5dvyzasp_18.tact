struct NullableStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestOpt {
    var1: NullableStruct;

    init() {
        self.var1 = NullableStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}