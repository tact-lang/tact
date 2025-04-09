struct DefaultVals {
    a: Int = 123;
    b: Bool = false;
    c: String = "test";
    d: Int?;
    e: Bool?;
}

contract DefaultsAndOptional {
    def: DefaultVals;

    init() {
        self.def = DefaultVals{ };
    }
}