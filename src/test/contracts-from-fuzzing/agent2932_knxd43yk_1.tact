struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedStruct: InnerStruct;

    init() {
        self.nestedStruct = InnerStruct{ a: 1, b: true };
    }
}