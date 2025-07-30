contract DefaultInitialized {
    num: Int = 1;
    opt: Bool? = null;
    str: String = "hello";
    flag: Bool = false;

    init() {
        self.num = 2;
        self.opt = true;
        self.str = "world";
        self.flag = true;
    }
}
