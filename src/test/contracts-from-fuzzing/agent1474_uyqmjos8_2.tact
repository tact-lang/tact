struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    p: Nested;

    init() {
        self.p = Nested{ x: 10, y: false, z: "ok" };
    }
}