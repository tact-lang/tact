struct InnerStruct {
    foo: Int;
    bar: String;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{foo: 1, bar: "test"};
    }
}