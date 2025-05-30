struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    field: NestedOptionalStruct;
    
    init() {
        self.field = NestedOptionalStruct{
            a: null,
            b: true,
            c: "hello"
        };
    }
}