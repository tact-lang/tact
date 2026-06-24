struct Bools {
    x: Bool;
    y: Bool;
}

contract DoubleBoolOpt {
    a: Bools?;

    init() {
        self.a = null;
    }
}