struct DefOptStr {
    s: String? = "pre-set";
}

contract OptStrDefault {
    val: DefOptStr;

    init() {
        self.val = DefOptStr{};
    }
}