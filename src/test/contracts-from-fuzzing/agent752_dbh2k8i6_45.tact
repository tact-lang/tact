struct DefaultStringOpt {
    s: String? = null;
}

contract DefaultOptStr {
    val: DefaultStringOpt;

    init() {
        self.val = DefaultStringOpt{};
    }
}