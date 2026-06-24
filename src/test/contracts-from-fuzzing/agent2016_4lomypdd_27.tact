struct A {
    a: Int;
}

contract Test {
    x: A?;
    y: Int?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}