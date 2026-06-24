struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiVars {
    x: Int;
    y: Bool;
    z: String;
    bundle: Nested;

    init() {
        self.x = 100;
        self.y = true;
        self.z = "nested";
        self.bundle = Nested{ x: 1, y: false, z: "inside" };
    }
}
