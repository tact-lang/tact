struct InnerStruct {
    foo: Int;
}

contract StructDefault {
    s: InnerStruct = InnerStruct{ foo: 123 };

    init() {
        self.s = InnerStruct{ foo: 456 };
    }
}