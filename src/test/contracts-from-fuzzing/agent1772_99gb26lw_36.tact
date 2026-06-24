struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract Test36 {
    s: S;

    init() {
        self.s = S{ a:1, b:false, c:null };
    }

    get fun a(): Int {
        return self.s.a;
    }
}