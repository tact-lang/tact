struct Nested {
    a: Int;
    b: Bool?;
    c: Int?;
}

contract TestContract {
    x: Int;
    y: Bool;
    z: Nested;
    w: Int?;
    u: Bool?;
    v: Nested?;

    init() {
        self.x = 42;
        self.y = true;
        self.z = Nested{ a:1, b:null, c:2 };
        self.w = null;
        self.u = false;
        self.v = Nested{ a:9, b:true, c:null };
    }
}