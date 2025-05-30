struct EmptyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptStruct {
    st: EmptyOptional;
    init() {
        self.st = EmptyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}