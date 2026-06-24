struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }

contract ChainOfStructs {
    foo: C;

    init() {
        self.foo = C{ b: B{ a: A{ x: 1 } } };
    }
}