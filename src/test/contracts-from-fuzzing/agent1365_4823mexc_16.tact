struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

struct OuterStruct {
    x: OptionalStruct;
    y: Int;
}

contract StructWithOptional {
    fld: OuterStruct;

    init() {
        self.fld = OuterStruct{
            x: OptionalStruct{
                a: null,
                b: null,
                c: null,
                d: null,
                e: null,
                f: null,
            },
            y: 42,
        };
    }
}