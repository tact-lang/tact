struct A { field1: Int }

struct B { a: A }

struct C { b: B }

struct D { c: C }

contract TestContract {
    x: D;

    init() {
        self.x = D{ c: C{ b: B{ a: A{ field1: 123 } } } };
    }
}