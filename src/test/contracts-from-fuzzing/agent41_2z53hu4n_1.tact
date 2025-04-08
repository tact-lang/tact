struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    myField: InnerStruct;

    init() {
        self.myField = InnerStruct{ a: 10, b: true };
    }
}