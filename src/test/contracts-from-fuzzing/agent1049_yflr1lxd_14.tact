struct StructWithOptional {
    foo: Int?;
    bar: String?;
}

contract OptionalInsideStruct {
    s: StructWithOptional;

    init() {
        self.s = StructWithOptional{ foo:null, bar:null };
    }
}