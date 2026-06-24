struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Address? = null;
}

contract Test17 {
    val: Defaults;
    init() {
        self.val = Defaults{};
    }
}