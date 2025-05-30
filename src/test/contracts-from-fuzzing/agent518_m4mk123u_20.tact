struct DefOpt {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hi";
}

contract DefaultsOptional {
    val: DefOpt;

    init() {
        self.val = DefOpt{}; // should use defaults above
    }
}