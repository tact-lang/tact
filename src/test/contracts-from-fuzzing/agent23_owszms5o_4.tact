struct Inner {
    v: Int?;
}

contract OptNestedField {
    s: Inner? = null;

    init() {
        self.s = Inner{ v: null };
    }
}