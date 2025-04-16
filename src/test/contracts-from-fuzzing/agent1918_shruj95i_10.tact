struct LargeNested {
    s1: String;
    s2: String;
    int1: Int;
    bool1: Bool;
    optStr1: String?;
    optBool1: Bool?;
    optInt1: Int?;
    str3: String;
    bool2: Bool;
    optInt2: Int?;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            s1: "X",
            s2: "Y",
            int1: 1,
            bool1: true,
            optStr1: null,
            optBool1: false,
            optInt1: null,
            str3: "Z",
            bool2: true,
            optInt2: null
        };
    }
}