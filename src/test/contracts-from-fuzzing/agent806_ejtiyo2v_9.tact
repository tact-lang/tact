contract TestContract {
    flag1: Bool = true;
    flag2: Bool = false;
    optStr: String? = null;
    number: Int = -5;
    text: String = "text";
    init() {
        self.flag1 = false;
        self.flag2 = true;
        self.optStr = "abc";
        self.number = 42;
        self.text = "zzz";
    }
}