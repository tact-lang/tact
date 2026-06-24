struct OptionalStructField {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract Test {
    data: OptionalStructField;
    init() {
        self.data = OptionalStructField{ inner: Inner{ x: 7 } };
    }
}