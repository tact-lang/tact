struct Opts {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    s: Opts = Opts{ a: null, b: null };

    init() {
        self.s = self.s;
    }
}