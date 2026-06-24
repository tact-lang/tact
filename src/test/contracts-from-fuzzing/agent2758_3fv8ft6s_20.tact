contract TestContract {
    single: Int;
    opt1: Int?;
    str1: String;
    opt2: Bool?;
    str2: String?;

    init() {
        self.single = 0;
        self.opt1 = null;
        self.str1 = "x";
        self.opt2 = true;
        self.str2 = null;
    }
}