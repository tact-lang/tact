struct A { a: Int; }
struct B { b: Int; a: A; }
struct C { b: B; c: Int; }
contract MixNested {
    data: C;

    init() {
        self.data = C{ b: B{ b:2, a: A{a:1} }, c: 3 };
    }
}