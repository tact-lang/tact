struct A {
    q: Int?;
}

contract OptionalSerialized {
    x: Int?;
    y: A?;

    init() {
        self.x = null;
        self.y = null;
    }
}