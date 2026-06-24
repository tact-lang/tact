struct NestedS {
    inner: Int;
}

contract OptionalFieldDefault {
    s: NestedS? = null;

    init() {
        self.s = null;
    }
}