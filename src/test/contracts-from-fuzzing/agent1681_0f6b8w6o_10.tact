struct ComboNest {
    a: Int?;
    b: Bool;
    c: InnerCombo;
}

struct InnerCombo {
    d: Int;
    e: Bool?;
}

contract MixedOptNest {
    store: ComboNest;

    init() {
        self.store = ComboNest{
            a: null,
            b: true,
            c: InnerCombo{ d: 1, e: null }
        };
    }

    receive() {
        self.store = ComboNest{
            a: 5,
            b: false,
            c: InnerCombo{ d: 42, e: true }
        };
    }
}