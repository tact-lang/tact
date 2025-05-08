struct A { b: B }
struct B { c: C }
struct C { d: D }
struct D { e: E }
struct E { x: Int }

contract Depth5Nesting {
    f: A;

    init() {
        self.f = A{ b: B{ c: C{ d: D{ e: E{ x: 99 } } } } };
    }
}