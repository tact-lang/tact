struct OptionalStr {
    s: String? = null;
}

contract TestOptStr {
    sopt: OptionalStr;

    init() {
        self.sopt = OptionalStr{ s:null };
    }
}