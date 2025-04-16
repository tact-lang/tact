struct T {
    a: Int;
}

contract OptionalDeep {
    x: T?;
    y: T?;
    z: T?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}