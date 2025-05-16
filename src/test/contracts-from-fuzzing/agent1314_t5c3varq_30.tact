struct HasStringOpt {
    s: String?;
}

contract OptStringField {
    so: HasStringOpt;

    init() {
        self.so = HasStringOpt {
            s: null,
        };
    }
}