struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
contract DeeplyNested {
    value: D;

    init() {
        self.value = D{ d: C{ c: B{ b: A{ a: 7 } } } };
    }
}