// Contract with multiple persistent optional and composite with explicit null defaults
struct Deep {
    opt1: Int? = null;
    opt2: Bool? = null;
}

contract MultiNull {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
    s: Deep = Deep{};

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.s = Deep{};
    }
}