struct ListOfOptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptPrims {
    data: ListOfOptionalPrimitives;

    init() {
        self.data = ListOfOptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}