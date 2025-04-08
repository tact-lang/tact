struct Combo {
    s: String? = null;
    a: Address? = null;
}

contract TestC {
    combo: Combo;

    init() {
        self.combo = Combo{};
    }
}