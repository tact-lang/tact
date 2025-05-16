contract FieldsDefault {
    foo: Int = 0;
    note: String? = null;
    flag: Bool = true;

    init() {
        self.foo = 123;
        self.note = "hello";
    }
}
