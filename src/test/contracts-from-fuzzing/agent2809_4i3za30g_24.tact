struct Opts {
    a: Address? = null;
    c: Cell? = null;
}

contract GoodStructDefault {
    f: Opts;

    init() {
        self.f = Opts{};
    }
}