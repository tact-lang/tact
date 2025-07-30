struct A { a: Int; }
struct B { b: Int; }
struct C { a: A; b: B; }

contract EmbeddedComplex {
    data: C;
    init() {
        self.data = C{ a: A{a: 10}, b: B{b:20} };
    }
}