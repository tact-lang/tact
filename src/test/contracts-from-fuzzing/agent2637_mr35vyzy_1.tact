struct Nested {
    innerOpt: Bool?;
    innerVal: Int;
}

contract TestContract {
    testField: Nested;    

    init() {
        self.testField = Nested{innerOpt: null, innerVal: 7};
    }
}