struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultStructs {
    def: DefaultVals;

    init() {
        self.def = DefaultVals{}; // use defaults
    }
}