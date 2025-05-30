struct Combo {
    optInt: Int?;
    boolVal: Bool;
    txt: String;
    optBool: Bool?;
}

contract Mixed {
    val: Combo;

    init() {
        self.val = Combo{
            optInt: null,
            boolVal: true,
            txt: "abc",
            optBool: false
        };
    }
}