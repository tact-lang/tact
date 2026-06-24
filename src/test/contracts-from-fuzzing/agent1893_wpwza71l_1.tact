struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: InnerStruct;
    anotherField: Bool;

    init() {
        self.s = InnerStruct{ a: 1, b: true };
        self.anotherField = false;
    }
}