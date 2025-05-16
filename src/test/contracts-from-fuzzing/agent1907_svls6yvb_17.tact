contract PersistentNoDefaults {
    foo: Int;
    bar: Bool;
    text: String;

    init() {
        self.foo = 5;
        self.bar = false;
        self.text = "none";
    }
}