struct OptionalStructField {
    maybeStruct: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract OptStruct {
    holder: OptionalStructField;
    init() {
        self.holder = OptionalStructField{
            maybeStruct: null
        };
    }
}