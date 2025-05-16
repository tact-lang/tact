struct A { a1: Int; a2: Bool; a3: String?; }
struct B { b1: Int; b2: Bool; b3: String?; }
struct C { c1: Int; c2: Bool; c3: String?; }

contract WideStructContract {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{ a1:1, a2:true, a3:"A"};
        self.f2 = B{ b1:2, b2:false, b3:"B"};
        self.f3 = C{ c1:3, c2:true, c3:"C"};
    }
}