struct S {
    x: Int;
    y: Int?;
}

contract OptNested {
    s: S;

    init() {
        self.s = S{ x: 7, y: null };
    }
}