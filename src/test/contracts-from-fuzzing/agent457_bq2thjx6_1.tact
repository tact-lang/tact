struct NestedOptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: NestedOptStruct;
    init() {
        self.data = NestedOptStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}