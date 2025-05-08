struct NullStruct {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract SetNullsInit {
    data: NullStruct;

    init() {
        self.data = NullStruct{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
