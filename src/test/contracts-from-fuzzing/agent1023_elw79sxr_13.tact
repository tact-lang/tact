struct OptionalNested {
    inner: Holder?;
}

struct Holder {
    val: Int;
}

contract OptionalStructPersistent {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ inner: null };
    }
}