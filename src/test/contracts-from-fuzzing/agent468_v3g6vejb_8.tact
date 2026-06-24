struct DefaultVals {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
}

contract TestContract {
    testField: DefaultVals;
    
    init() {
        self.testField = DefaultVals{};
    }
}