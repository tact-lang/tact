struct JustBool {
    b: Bool;
}

contract JustBoolComplex {
    s: JustBool;
    flag: Bool;
    init() {
        self.s = JustBool { b: false };
        self.flag = true;
    }
}