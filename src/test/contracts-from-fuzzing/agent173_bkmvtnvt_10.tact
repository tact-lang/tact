struct Combo {
    a: Int as coins;
    b: Int? as uint64;
    c: Bool?;
}

contract ComboPersist {
    val: Combo;

    init() {
        self.val = Combo{ a: 777, b: 42, c: true };
    }
}