contract TestContract {
    opt_i: Int? = null;
    opt_b: Bool? = null;
    opt_s: String? = null;

    init() {
        self.opt_i = 123;
        self.opt_b = true;
        self.opt_s = "str";
    }
    receive() {}
}