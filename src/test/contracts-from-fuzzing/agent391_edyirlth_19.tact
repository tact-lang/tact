struct Combo {
    a: Int;
    b: String?;
}

contract NestedOptionalPaths {
    opt_combo: Combo?;
    init() {
        self.opt_combo = null;
    }
}