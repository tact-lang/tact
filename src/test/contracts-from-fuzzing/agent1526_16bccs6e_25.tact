struct DefsOptNest {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
    d: Int?;
}

contract DefOptCombine {
    val: DefsOptNest;

    init() {
        self.val = DefsOptNest{}; // omit all, defaults and nulls auto-fill
    }
}