struct DefaultOptionals {
    s: String = "default";
    n: Int?;            // default implicit null
    b: Bool? = true;    // optional explicitly default true
}

contract OptionalDefaults {
    val: DefaultOptionals;

    init() {
        self.val = DefaultOptionals{};
    }
}