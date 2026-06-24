struct S {
    a: Int;
    b: Bool;
}

contract ManySet {
    s: S;

    init() {
        self.s = S{a:0,b:false};
        self.s.a = 42;
        self.s.b = true;
    }
}