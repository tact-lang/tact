struct DefaultOptional {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptDefaults {
    val: DefaultOptional;
    init() {
        self.val = DefaultOptional{};
    }
}