struct Combo {
    flag: Bool?;
    str: String;
    amount: Int as uint64;
}

struct WrapCombo {
    c1: Combo;
    c2: Combo;
}

contract TestContract {
    wrap: WrapCombo;

    init() {
        self.wrap = WrapCombo{
            c1: Combo{ flag: null, str: "hello", amount: 100 },
            c2: Combo{ flag: true, str: "world", amount: 200 },
        };
    }
}