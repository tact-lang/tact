struct A { value: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }

contract ChainFive {
    node: E;
    init() {
        self.node = E{ d: D{ c: C{ b: B{ a: A{ value: 23 } } } } };
    }
}