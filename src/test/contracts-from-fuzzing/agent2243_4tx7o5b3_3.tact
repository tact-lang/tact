struct DefaultOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDefaults {
    val: DefaultOptionals;

    init() {
        self.val = DefaultOptionals{};
    }
}
