struct Nested {
    x: Int?;
    y: Bool?;
}

struct Combo {
    a: Int = 10;
    b: String = "x";
    c: Nested?;
}

contract DefaultsAndNested {
    s: Combo;

    init() {
        self.s = Combo{};
    }
}
