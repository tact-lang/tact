struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract OptNestedStructField {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ inner: null };
    }
}