struct InnerStruct {
    a: Int;
    b: String;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ a: 1, b: "test" };
    }
}