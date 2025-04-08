struct Inside { x: Int; }

contract OptionalStructSet {
    s: Inside?;

    init() {
        self.s = Inside{ x: 123 };
    }
}