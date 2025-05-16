struct OptionalStructField {
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract OptionalStructFieldContract {
    s: OptionalStructField;

    init() {
        self.s = OptionalStructField{
            nested: Inner{x: 123}
        };
    }
}