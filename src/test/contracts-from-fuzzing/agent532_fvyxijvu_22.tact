struct DefaultVals {
    a: Int = 0; 
    b: String = "";
    c: Bool = false;
}

contract StructWithDefaults {
    myField: DefaultVals;

    init() {
        self.myField = DefaultVals{};
    }
}