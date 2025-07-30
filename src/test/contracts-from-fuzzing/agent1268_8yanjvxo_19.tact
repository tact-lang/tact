struct OptionalStructField {
    inner: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    s: OptionalStructField;

    init() {
        self.s = OptionalStructField{
            inner: null
        };
    }
}