struct NullStruct {
    a: Int?;
    b: Int?;
}

contract StructAllNull {
    s: NullStruct;
    init() {
        self.s = NullStruct {
            a: null,
            b: null
        };
    }
}