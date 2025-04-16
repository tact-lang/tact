struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedField: InnerStruct;

    init() {
        self.nestedField = InnerStruct{
            a: 10,
            b: true,
        };
    }
}