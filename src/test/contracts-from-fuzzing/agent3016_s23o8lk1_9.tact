struct OptionalStructField {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: OptionalStructField;

    init() {
        self.data = OptionalStructField{
            inner: null
        };
    }
}