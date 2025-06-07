struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{
            a: 12,
            b: true,
        };
    }
}
