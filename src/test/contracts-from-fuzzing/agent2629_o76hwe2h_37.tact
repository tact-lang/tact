struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: Int; }

contract ChainDepth {
    a: A = A{ b: B{ c: C{ d: D{ e: E{ f: 5 } } } } };

    init() {}
}