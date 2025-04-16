struct OptionalsOnly {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    opts: OptionalsOnly;

    init() {
        self.opts = OptionalsOnly{ a:null, b:null, c:null };
    }
}