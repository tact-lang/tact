// test deeply nested optional fields partially missing
struct A { p: Int?; }
struct B { p: A?; }
struct C { p: B?; }
struct D { p: C?; }

contract DeepOptPartial {
    s: D;

    init() {
        self.s = D{ p: C{ p: null } };
    }
}