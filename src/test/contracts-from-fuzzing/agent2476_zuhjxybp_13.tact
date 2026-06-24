struct InnerStruct {
    a: Int;
    b: Int;
}

contract OptionalStructField {
    s: InnerStruct?;
    init() {
        self.s = InnerStruct{a:1, b:2};
    }
}