struct EmptyOpt {
    s: String?;
}

contract TestContract {
    f: EmptyOpt;

    init() {
        self.f = EmptyOpt { s: null };
    }
}