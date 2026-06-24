struct DefOpt {
    val: Int? = null;
    txt: String? = null;
}

contract Fuzz32 {
    d: DefOpt;

    init() {
        self.d = DefOpt{};
    }
}