struct Leaf {
    val: Int as coins;
    note: String = "å";
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    middle: Mid;
    flag: Bool?;
}

contract DeepMix {
    r: Root;

    init() {
        self.r = Root{ middle: Mid{ leaf: Leaf{ val: ton("2"), note: "Ω" } }, flag: null };
    }
}