struct Options {
    f1: Int? = null;
    f2: String? = null;
    f3: Bool? = true;
}

contract TestContract {
    opts: Options;

    init() {
        self.opts = Options{};
    }
}