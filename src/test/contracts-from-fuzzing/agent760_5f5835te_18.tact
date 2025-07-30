struct Opts {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract ManyOptionals {
    opts: Opts = Opts{};

    init() {
        self.opts = Opts{
            a: null,
            b: null,
            c: null,
        };
    }
}