struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    field: NestedOptional;
    
    init() {
        self.field = NestedOptional{
            a: null,
            b: true,
            c: "hello",
            d: null,
        };
    }
}