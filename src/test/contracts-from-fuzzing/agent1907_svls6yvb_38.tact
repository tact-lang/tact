contract UnusualOrder {
    opt: Int?;
    normal: Int;
    str: String;
    flag: Bool;

    init() {
        self.opt = null;
        self.normal = 5;
        self.str = "s";
        self.flag = true;
    }
}