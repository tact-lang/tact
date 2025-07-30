struct Combo {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int;
    bool2: Bool;
    str2: String;
}

contract TestContract {
    combined: Combo;

    init() {
        self.combined = Combo{
            int1: 1,
            bool1: true,
            str1: "hello",
            int2: 2,
            bool2: false,
            str2: "world",
        };
    }
}