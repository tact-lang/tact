contract ZeroDefaults {
    num: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.num = 0;
        self.flag = false;
        self.text = "";
        self.optInt = null;
        self.optBool = null;
    }
}
// explicit initial assignment with zero/false/null to check default handling