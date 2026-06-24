struct Combo {
    int1: Int;
    bool1: Bool;
    str1: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ComboTest {
    val: Combo;

    init() {
        self.val = Combo{
            int1: 7,
            bool1: true,
            str1: "hi",
            optInt: null,
            optBool: null,
            optStr: "s"
        };
    }
}