contract TestContract {
    num: Int = 1;
    txt: String = "text";
    flag: Bool = false;
    optnum: Int? = null;
    optstr: String? = null;
    optflag: Bool? = true;

    init() {
        self.num = 123;
        self.txt = "done";
        self.flag = true;
        self.optnum = null;
        self.optstr = "wow";
        self.optflag = false;
    }
}