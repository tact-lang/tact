struct Cont {
    a: Int;
    b: Bool;
    c: String?;
}

contract NestedOptionals {
    x: Cont?;
    y: Cont?;

    init() {
        self.x = null;
        self.y = Cont{ a: 1, b: false, c: null };
    }
}
