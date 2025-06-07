struct DeepOptionalNested {
    inner: Int?;
}

struct Outer {
    innerStruct: DeepOptionalNested?;
}

contract OptionalNestedStructField {
    st: Outer;

    init() {
        self.st = Outer{innerStruct: null};
    }
}