struct S {
    a: Int;
}

contract C {
    f: S;

    init() {
        self.f = S{ a:1 };
    }
    
    get fun g(): Int {
        return self.f.a;
    }
}