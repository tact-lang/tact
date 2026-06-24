struct A { foo: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }

contract Test {
    deep: D;

    init() {
        self.deep = D{c: C{b: B{a: A{foo: 123}}}};
    }
}