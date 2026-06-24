struct Opts {
    a: Int? = null;
}
contract DefaultNull {
    f: Opts;
    init() { self.f = Opts{}; }
}