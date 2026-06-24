struct HasDefaultOpt {
    extra: Int = 42;
    opt: Bool? = null;
}

contract UseHasDefaultOpt {
    s: HasDefaultOpt;
    init() {
        self.s = HasDefaultOpt{};
    }
}