struct NestedWithDefaults {
    a: Int = 10;
    b: String = "test";
    opt: Int?;
}

contract WithDefaults {
    field: NestedWithDefaults;
    
    init() {
        self.field = NestedWithDefaults{
            opt: null,
        };
    }
}