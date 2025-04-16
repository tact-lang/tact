// test deeply nested optional fields all present
struct A { p: Int?; }
struct B { p: A?; }
struct C { p: B?; }
struct D { p: C?; }

contract DeepOptFull {
    s: D;

    init() {
        self.s = D{ p: C{ p: B{ p: A{ p:123 } } } };
    }
}