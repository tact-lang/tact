struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalStructField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: null };
    }
}
