struct DefAll {
    a: Int = 1;
    b: Bool = true;
}

contract AllDefaults {
    val: DefAll;
    init() {
        self.val = DefAll{};
    }
}