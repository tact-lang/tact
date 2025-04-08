struct InnerStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    nestedField: InnerStruct;

    init() {
        self.nestedField = InnerStruct{ x: 5, y: 10 };
    }
}
