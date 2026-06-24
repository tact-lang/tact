struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionalContract {
    s: NestedOptionalStruct?;
    
    init() {
        self.s = NestedOptionalStruct{
            a: 1,
            b: null,
            c: "hello",
        };
    }
}
