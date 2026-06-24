// Now combine deep initialized optionals and nested default values

struct Leaf {
    n: Int = 100;
    s: String = "leafdef";
}

struct Mid {
    leaf: Leaf?;
    count: Int = 7;
}

struct Top {
    mid: Mid?;
    title: String = "top";
}

contract ComboDeepDefOpt {
    val: Top;
    init() {
        self.val = Top {
            mid: null,
            title: "newtop",
        };
    }
}
