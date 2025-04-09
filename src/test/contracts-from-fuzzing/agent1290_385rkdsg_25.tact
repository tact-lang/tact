contract DefaultVals {
    n: Int = 5;
    s: String = "hello";
    b: Bool = true;
    opt: Int? = null;

    init() {
        self.n = 10;
        self.s = "world";
        self.b = false;
        self.opt = 20;
    }

    receive() {
        self.n = 15;
        self.s = "!";
        self.b = true;
        self.opt = null;
    }
}