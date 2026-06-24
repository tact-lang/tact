struct Inner {
    foo: Int;
}

contract Test {
    x: Inner?;
    y: Bool;

    init() {
        self.x = null;
        self.y = true;
    }
}