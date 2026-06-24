// defaulted primitive vars and explicit optionals
contract Opts {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.i = 5;
        self.b = true;
        self.s = "yo";
    }
}