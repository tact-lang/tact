struct StructOptDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
}

contract StructOptDefault {
    s: StructOptDefaults;
    
    init() {
        self.s = StructOptDefaults{
            d: null,
        };
    }
}
