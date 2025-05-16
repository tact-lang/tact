struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
struct E { e: D; }

contract NestedStructs {
    field: E;

    init() {
        self.field = E{ e: D{ d: C{ c: B{ b: A{ a: 321 } } } } };
    }
}