struct OptionalStructField {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract TestContract {
    s: OptionalStructField;

    init() {
        self.s = OptionalStructField{
            maybeInner: null
        };
    }
}