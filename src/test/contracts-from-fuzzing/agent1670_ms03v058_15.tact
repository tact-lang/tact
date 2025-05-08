contract DefaultedFields {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
    opt: Int? = null;
    opt2: String? = null;
    flag: Bool = true;

    init() {
        self.a = 42;
        self.b = true;
        self.s = "bye";
        self.opt = 5;
        self.opt2 = null;
        self.flag = false;
    }
}
