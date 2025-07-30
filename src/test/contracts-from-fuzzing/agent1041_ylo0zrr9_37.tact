struct Defaulted {
    val: Int = 10;
    optVal: Int? = null;
    flag: Bool = false;
    txt: String = "a";
    optTxt: String? = null;
}

contract ZeroInit {
    stored: Defaulted;

    init() {
        self.stored = Defaulted{};
    }
}
