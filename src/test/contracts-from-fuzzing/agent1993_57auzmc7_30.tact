contract MixDefaults {
    foo: Int = 1;
    bar: Bool;
    baz: String = "hi";

    init() {
        self.bar = false;
    }
}