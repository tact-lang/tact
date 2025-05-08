struct Poly {
    a: Int;
    b: Bool;
    s: String;
}

contract C {
    f1: Poly;
    f2: Poly;

    init() {
        self.f1 = Poly{ a:1, b:true, s:"hi" };
        self.f2 = Poly{ a:2, b:false, s:"ho" };
    }
}