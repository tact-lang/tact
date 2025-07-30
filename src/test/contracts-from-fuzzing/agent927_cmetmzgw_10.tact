struct EmptyStringOpt {
    s: String? = null;
}

contract TestEmptyOpt {
    val: EmptyStringOpt;

    init() {
        self.val = EmptyStringOpt{};
    }
}