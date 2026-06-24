struct S {
    x: Int;
}

contract InsideOptional {
    x: S?;
    y: Int;

    init() {
        self.x = null;
        self.y = 42;
    }
}
