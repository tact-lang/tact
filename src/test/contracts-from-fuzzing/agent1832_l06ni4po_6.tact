contract EmptyOptionalAndNormal {
    optInt: Int?;
    str: String;
    flag: Bool;

    init() {
        self.optInt = null;
        self.str = "hello";
        self.flag = false;
    }
}
