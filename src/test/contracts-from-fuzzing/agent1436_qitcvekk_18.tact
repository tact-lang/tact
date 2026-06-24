struct Combo {
    flag: Bool;
    txt: String;
    num: Int;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract TestContract {
    mixed: Combo;

    init() {
        self.mixed = Combo{
            flag: true,
            txt: "hi there",
            num: 123,
            optInt: null,
            optStr: "abc",
            optBool: null
        };
    }
}