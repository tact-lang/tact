struct Nested {
    innerVal: Int;
    flag: Bool;
}

contract TestContract {
    myStruct: Nested;

    init() {
        self.myStruct = Nested{ innerVal: 4, flag: true };
    }
}