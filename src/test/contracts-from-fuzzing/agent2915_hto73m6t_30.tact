struct Opts {
    a: Int? = 5;
    b: Bool? = true;
    c: String? = "opt";
}

contract TestContract {
    opts: Opts;

    init() {
        self.opts = Opts{};
    }
}
