struct Info {
    s: String;
}

contract InfoOpt {
    f1: Info?;
    f2: Info?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}