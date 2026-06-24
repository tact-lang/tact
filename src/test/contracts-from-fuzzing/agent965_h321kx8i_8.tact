struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract TestPersistent {
    s: S;
    a: Int;
    b: Bool;
    c: String;
    d: Int?;

    init() {
        self.s = S{x: 1, y: true, z: "z"};
        self.a = 10;
        self.b = false;
        self.c = "c";
        self.d = null;
    }
}