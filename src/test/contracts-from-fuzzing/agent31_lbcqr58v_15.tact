struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    c: Int;
    d: Int?;
}

contract Test {
    x: S1;
    y: S2;

    init() {
        self.x = S1{ a:1, b:null };
        self.y = S2{ c:2, d:null };
    }
}