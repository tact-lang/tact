struct Multi {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int;
    bool2: Bool;
    str2: String;
}

contract MultiFields {
    m: Multi;

    init() {
        self.m = Multi{
            int1: 1, bool1: true, str1: "x",
            int2: 2, bool2: false, str2: "y"
        };
    }
}