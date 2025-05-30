// Test contract with an optional struct
struct InnerStruct {
    foo: Int;
    bar: String;
}

contract OptionalStructField {
    maybeInner: InnerStruct?;

    init() {
        self.maybeInner = null;
    }
}