struct OptionalStructField {
    inner: Inner?;
}

struct Inner {
    a: Int;
}

contract TestContract {
    testField: OptionalStructField;

    init() {
        self.testField = OptionalStructField{
            inner: null
        };
    }
}