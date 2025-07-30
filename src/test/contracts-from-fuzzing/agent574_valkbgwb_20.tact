struct ComboInner {
    foo: Int = 1;
    bar: String? = null;
    baz: Bool? = null;
}

contract OptionalStructWithDefaults {
    data: ComboInner?;

    init() {
        self.data = null;
    }

    receive() {
        if (self.data != null && self.data!!.bar != null) {
            dump(self.data!!.bar!!);
        }
    }
}