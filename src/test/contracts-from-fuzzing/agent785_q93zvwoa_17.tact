struct Nested {
    a: Int;
    b: Bool;
}

contract OptInMid {
    x: Int;
    y: Nested?;
    z: Bool;

    init() {
        self.x = 1;
        self.y = null;
        self.z = true;
    }
}