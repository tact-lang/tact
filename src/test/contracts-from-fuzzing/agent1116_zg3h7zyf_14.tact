struct A { p: Int?; q: Bool; }
struct B { s: String?; t: Int; }
struct C { u: Bool?; v: String; }

contract TestContract {
    aData: A;
    bData: B;
    cData: C;

    init() {
        self.aData = A{ p: null, q: true };
        self.bData = B{ s: "hi", t: 10 };
        self.cData = C{ u: false, v: "test" };
    }
}