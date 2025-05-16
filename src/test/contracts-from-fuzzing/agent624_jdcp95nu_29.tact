struct DefOpts {
    a: Int? = 5;
    b: Bool? = true;
    c: String? = "default";
}

contract DefOptStorage {
    val: DefOpts;

    init() {
        self.val = DefOpts{};
    }
}