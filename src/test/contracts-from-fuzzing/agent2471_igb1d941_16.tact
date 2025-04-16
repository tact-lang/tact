struct StructWithManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract ContractWithManyOptions {
    optStruct: StructWithManyOptions;

    init() {
        self.optStruct = StructWithManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}