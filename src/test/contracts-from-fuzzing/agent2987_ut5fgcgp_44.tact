struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }

contract FourNestedStruct {
    data: D;

    init() {
        self.data = D{ c: C{ b: B{ a: A{ x: 1 } } } };
    }
}
