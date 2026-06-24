contract DefaultMix {
    i: Int = 123;
    b: Bool = true;
    s: String = "hello";
    opt: Int? = null;

    init() {
        self.i = 5;
        self.b = false;
        self.s = "bye";
        self.opt = 100;
    }
}