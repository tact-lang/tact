struct Combo {
    a: Int? = null;
    b: Bool = false;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: String = "abc";
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{};
    }
}
