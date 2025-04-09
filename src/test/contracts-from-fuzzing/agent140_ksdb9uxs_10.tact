struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String;
    val: Int?;
}

contract OptionalStructField {
    optionalInner: InnerStruct?;

    init() {
        self.optionalInner = null;
    }
}