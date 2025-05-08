contract OptAndNonOpt {
    fixedNum: Int = 77;
    optionalNum: Int?;
    optionalStr: String?;

    init() {
        self.optionalNum = null;
        self.optionalStr = "abc";
    }
}