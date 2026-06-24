struct Combo {
    a: Int = 3;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract ComboContract {
    val: Combo;

    init() {
        self.val = Combo{ b: null, d: null };
    }
}