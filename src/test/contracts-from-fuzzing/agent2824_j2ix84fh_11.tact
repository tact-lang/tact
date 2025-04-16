struct DefaultOptional {
    s: String?;
    flag: Bool?;
}

contract OptionalDefaults {
    val: DefaultOptional;

    init() {
        self.val = DefaultOptional{ s: null, flag: null };
    }
}