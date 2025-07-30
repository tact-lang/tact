struct SubOptional {
    val: Int?;
}

struct Part {
    a: Int;
    b: SubOptional?;
}

struct BigCombo {
    p1: Part;
    p2: Part;
    p3: Part?;
    number: Int;
    flag: Bool;
}

contract NestedMixContract {
    combo: BigCombo;

    init() {
        self.combo = BigCombo {
            p1: Part{ a:1, b:null },
            p2: Part{ a:2, b:null },
            p3: null,
            number: 99,
            flag: true
        };
    }
}