struct Info {
    title: String = "Hi";
    flag: Bool;
}

contract WideFields {
    int1: Int = 1;
    int2: Int = 2;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "A";
    str2: String = "B";
    optInt: Int?;
    optBool: Bool?;
    info1: Info = Info{flag: true};
    info2: Info = Info{flag: false};

    init() {
        self.optInt = null;
        self.optBool = null;
    }
}