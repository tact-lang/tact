struct Funky {
    a: Int?;
    b: Bool;
    c: String?;
}

contract FunkContract {
    f: Funky;

    init() {
        self.f = Funky{ a: null, b: false, c: null };
    }
}