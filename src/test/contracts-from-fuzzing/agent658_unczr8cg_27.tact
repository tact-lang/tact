struct S {
    flag: Bool = true;
    text: String = "X";
    num: Int = 7;
}

contract AllDefaults {
    s: S;
    opt: Int? = null;

    init() {
        self.s = S{};
        self.opt = null;
    }
}