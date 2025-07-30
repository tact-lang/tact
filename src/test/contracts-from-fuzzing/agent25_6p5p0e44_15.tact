struct HasDefaultOpt {
    prop: String? = null;
}

contract OptWithDefault {
    s: HasDefaultOpt;

    init() {
        self.s = HasDefaultOpt{};
    }
}
