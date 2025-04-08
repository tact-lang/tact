struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    simpleField: InnerStruct;

    init() {
        self.simpleField = InnerStruct{ a: 5, b: true };
    }
}