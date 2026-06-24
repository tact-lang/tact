struct A { a: Int; }
struct B { b: Int; a: A; }
struct C { c: Int; b: B; }
struct D { d: Int; c: C; }

contract DeepChain {
    x: D;

    init() {
        self.x = D{ d:1, c:C{ c:2, b:B{ b:3, a:A{ a:4 } } } };
    }
}