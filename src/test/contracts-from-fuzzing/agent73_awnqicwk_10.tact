struct InnerStruct {
    foo: String?;
    bar: Bool;
}

contract MultiOptionalComplex {
    nullableInt: Int?;
    str: String;
    nested: InnerStruct?;
    init() {
        self.nullableInt = null;
        self.str = "hello";
        self.nested = InnerStruct{
            foo: "hi",
            bar: true
        };
    }
}