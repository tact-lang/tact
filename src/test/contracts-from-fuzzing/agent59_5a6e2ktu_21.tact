struct StrWrap {
    s: String;
}

contract DefaultStringOption {
    sopt: StrWrap? = null;
    str: String? = null;

    init() {
        self.sopt = null;
        self.str = null;
    }
}