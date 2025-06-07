struct Combo {
    x: Int;
    y: Bool;
    z: String?;
}

contract OptFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Combo?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hello";
        self.d = Combo{ x: 4, y: false, z: null };
    }
}