struct InnerOptStruct {
    foo: Int?;
}

contract OptStructField {
    s: InnerOptStruct;

    init() {
        self.s = InnerOptStruct{ foo: null };
    }
}
