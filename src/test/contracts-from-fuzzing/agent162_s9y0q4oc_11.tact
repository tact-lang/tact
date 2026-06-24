contract TypeMix {
    intval: Int = 1;
    boolval: Bool = true;
    strval: String = "string";
    opt1: Int? = null;
    opt2: String? = null;

    init() {
        self.opt1 = 42;
        self.opt2 = "hi";
    }
}