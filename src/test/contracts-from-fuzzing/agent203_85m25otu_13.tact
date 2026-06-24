struct InA {
    x: Int;
}

struct InB {
    s: String;
}

struct Combo {
    a: InA;
    b: InB;
    flag: Bool;
    coins: Int as coins;
}

contract TestContract {
    store: Combo;

    init() {
        self.store = Combo{
            a: InA{ x: 1 },
            b: InB{ s: "str" },
            flag: true,
            coins: ton("1"),
        };
    }
}