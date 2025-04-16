struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract NestedOptionals {
    combo: Combo?;

    init() {
        self.combo = null;
    }
}