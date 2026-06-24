struct Multi {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: Bool? = null;
}

contract TestContract {
    s: Multi = Multi{ a: 1, c: null };

    init() {
        self.s = Multi{ a: 2, c: null };
    }
}