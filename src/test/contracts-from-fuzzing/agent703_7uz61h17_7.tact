struct ComplexStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiVariableTest {
    first: ComplexStruct;
    second: Int;
    third: Bool;
    fourth: String;

    init() {
        self.first = ComplexStruct{x:5,y:false,z:"abc"};
        self.second = 1;
        self.third = true;
        self.fourth = "def";
    }
}