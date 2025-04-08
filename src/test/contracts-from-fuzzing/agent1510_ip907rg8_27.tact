struct HasStringOpt {
    s: String? = null;
}

contract OptStrDef {
    f: HasStringOpt;

    init() {
        self.f = HasStringOpt{};
    }
}