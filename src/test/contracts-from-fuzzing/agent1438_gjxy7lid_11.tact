struct DeepOption {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;
}

contract OptionalOfOptional {
    foo: DeepOption? = null;

    init() {
        self.foo = null;
    }
}