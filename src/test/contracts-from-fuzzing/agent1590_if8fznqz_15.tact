struct A { b: Int; }
struct B { c: A; }
struct C { d: B; }
struct D { e: C; }

contract DeepChain {
    x: D;
    init() {
        self.x = D{ e: C{ d: B{ c: A{ b: 5 } } } };
    }
}