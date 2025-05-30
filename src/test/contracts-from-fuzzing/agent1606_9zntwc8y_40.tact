struct DefaultOpts {
    i: Int? = null;
    s: String? = null;
    b: Bool? = null;
}

contract DefaultsInStructOpt {
    d: DefaultOpts;
    init() {
        self.d = DefaultOpts{};
    }
    receive() {
        let d = self.d;
    }
}