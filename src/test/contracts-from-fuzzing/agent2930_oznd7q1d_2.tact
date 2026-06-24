struct NestedStruct {
    innerS: String;
    innerI: Int;
    innerB: Bool;
}

contract StructInFields {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            innerS: "hello",
            innerI: 42,
            innerB: false,
        };
    }
}
