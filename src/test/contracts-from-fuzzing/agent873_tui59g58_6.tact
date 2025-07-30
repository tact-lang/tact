struct DefaultsComplex {
    one: Int = 1;
    two: Int = 2;
    txt: String = "default";
    flag: Bool = true;
}

contract DefaultsInStruct {
    field: DefaultsComplex;
    
    init() {
        self.field = DefaultsComplex{};
    }
}