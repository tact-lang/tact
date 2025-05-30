struct HasDefaults {
    required: Int;
    maybe: Bool? = null;
    name: String = "hello";
}

contract TestContract {
    info: HasDefaults;

    init() {
        self.info = HasDefaults{
            required: 5,
            // omit the rest, defaults take effect
        };
    }
}