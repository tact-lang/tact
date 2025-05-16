struct Leaf {
    val: Int?;
    flag: Bool?;
}

struct Mid {
    leaf: Leaf?;
    num: Int?;
}

struct Top {
    a: Mid?;
    b: Bool?;
}

contract Test {
    store: Top = Top{};

    init() {
        self.store = Top{ a: Mid{ leaf: Leaf{ val: 99, flag: true }, num: 7 }, b: false };
    }
}