struct EmptyOpt {
    s: String?;
}

contract NullStrOpt {
    f: EmptyOpt;

    init() {
        self.f = EmptyOpt{ s: null };
    }
}