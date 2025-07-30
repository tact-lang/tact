struct A { v: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract ChainNested {
    data: E;
    init() {
        self.data = E{ d: D{ c: C{ b: B{ a: A{ v: 42 } } } } };
    }
}