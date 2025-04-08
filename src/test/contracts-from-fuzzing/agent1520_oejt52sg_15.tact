struct Combo {
    x: Int;
    y: Bool;
    z: String?;
    nested: Nested?;
}

struct Nested {
    flag: Bool;
    desc: String;
}

contract TestCombo {
    combo: Combo;

    init() {
        self.combo = Combo {
            x: 10,
            y: false,
            z: null,
            nested: Nested {
                flag: true,
                desc: "desc"
            }
        };
    }
}