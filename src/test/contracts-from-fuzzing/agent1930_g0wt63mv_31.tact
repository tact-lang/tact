contract PersistentStrings {
    foo: String = "hello";
    bar: String;

    init() {
        self.bar = "world";
    }
}