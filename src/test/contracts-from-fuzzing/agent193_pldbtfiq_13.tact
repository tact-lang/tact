struct S {
    b: Bool;
}

contract OptionalNested {
    x: S?;
    y: Int;

    init() {
        self.x = null;
        self.y = 1;
    }
}