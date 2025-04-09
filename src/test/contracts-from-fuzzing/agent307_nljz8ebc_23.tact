struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract StructAndSeparateFields {
    s: S;
    x: Int;
    y: Bool;
    z: String?;

    init() {
        self.s = S{ a: 1, b: "inside", c: true };
        self.x = 2;
        self.y = false;
        self.z = null;
    }
}