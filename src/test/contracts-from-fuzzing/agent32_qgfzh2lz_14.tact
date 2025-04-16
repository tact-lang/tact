struct Combo {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Cell?;
}

contract MixedContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 42,
            b: true,
            c: null,
            d: myAddress(),
            e: null
        };
    }
}
