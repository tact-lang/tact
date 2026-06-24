struct BigInner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract BigNested {
    x: BigInner;
    y: BigInner;
    z: BigInner;

    init() {
        self.x = BigInner{ a: 1, b: true, c: "a", d: null, e: false, f: "x" };
        self.y = BigInner{ a: 2, b: false, c: "b", d: 3, e: null, f: null };
        self.z = BigInner{ a: 9, b: true, c: "c", d: null, e: true, f: "z" };
    }
}
