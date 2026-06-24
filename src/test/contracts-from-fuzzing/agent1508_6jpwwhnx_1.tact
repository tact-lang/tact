struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedField: InnerStruct;

    init() {
        self.nestedField = InnerStruct{ a: 1, b: true };
    }
}