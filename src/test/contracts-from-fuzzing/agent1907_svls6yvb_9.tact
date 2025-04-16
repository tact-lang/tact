contract DefaultPersistentInit {
    foo: Int = 7;
    bar: Bool = true;
    text: String = "hiya";

    init() {
        self.foo = 42;
        self.bar = false;
        self.text = "bye";
    }
}