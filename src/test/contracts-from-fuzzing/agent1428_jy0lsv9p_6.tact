struct DefOpts {
    a: Int? = null;
    b: Int? = 42;
    c: Bool = true;
    d: String = "default";
}

contract Defaults {
    f: DefOpts;

    init() {
        self.f = DefOpts{};
    }
}