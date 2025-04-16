struct Combo {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
}

contract TestContract {
    mix: Combo;

    init() {
        self.mix = Combo{ a: 42, b: true, c: null, d: null };
    }
}