// intentional same-named nested fields
struct A { foo: Int; }
struct B { foo: Int; }
struct C { a: A; b: B; }
contract SameNamed {
    store: C;
    init() {
        self.store = C{ a: A{ foo: 1 }, b: B{ foo: 2 } };
    }
}