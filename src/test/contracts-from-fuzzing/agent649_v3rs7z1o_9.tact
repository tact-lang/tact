struct S {
    x: Int;
    y: String;
    z: Int?;
}

contract MultiVars {
    a: S;
    b: S;
    c: S;
    
    init() {
        self.a = S{ x: 1, y: "a", z: null };
        self.b = S{ x: 2, y: "b", z: null };
        self.c = S{ x: 3, y: "c", z: null };
    }
}