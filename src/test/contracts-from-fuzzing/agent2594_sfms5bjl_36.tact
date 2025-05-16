struct SomeWithDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "h";
    d: Int?;
}

contract StructDefaults {
    f: SomeWithDefaults;
    init() {
        self.f = SomeWithDefaults{
            b:false,
            d:null
        };
    }
}