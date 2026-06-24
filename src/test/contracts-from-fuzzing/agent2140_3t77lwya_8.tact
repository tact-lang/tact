struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract LotsOfFields {
    s1: Int;
    s2: Int;
    s3: Int;
    s4: Int;
    s5: Int;
    s6: Int;
    nested: InnerStruct;

    init() {
        self.s1 = 1;
        self.s2 = 2;
        self.s3 = 3;
        self.s4 = 4;
        self.s5 = 5;
        self.s6 = 6;
        self.nested = InnerStruct { foo: 7, bar: true, baz: "ok" };
    }
}
