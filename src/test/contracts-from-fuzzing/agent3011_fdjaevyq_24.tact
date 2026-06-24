struct InnerStruct {
    a: Int?;
    b: String?;
}

contract StructWithInnerOptionals {
    foo: InnerStruct;
    init() {
        self.foo = InnerStruct{ a:null, b:null };
    }
}