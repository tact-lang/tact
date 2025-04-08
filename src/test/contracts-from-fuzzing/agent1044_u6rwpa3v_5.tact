struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestOptional {
    opt: OptionalFields;
    init() {
        self.opt = OptionalFields {
            a:null,
            b:true,
            c:null,
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f:null
        };
    }
}