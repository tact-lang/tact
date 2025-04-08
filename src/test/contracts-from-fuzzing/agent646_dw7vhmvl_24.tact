struct A { val: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract DeepChainTest {
    field: E;
    init() {
        self.field = E{ d: D{ c: C{ b: B{ a: A{ val: 5 } } } } };
    }
}