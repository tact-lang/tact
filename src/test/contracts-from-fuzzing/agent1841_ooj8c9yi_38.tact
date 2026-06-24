trait VariablesTrait {
    myInt: Int;
}

contract OnlyTrait with VariablesTrait {
    myInt: Int;

    init() {
        self.myInt = 123;
    }
}
