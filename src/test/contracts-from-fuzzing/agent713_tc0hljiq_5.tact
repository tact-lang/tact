struct A { foo: Int; }
struct B { bar: Int; }

contract MultiStructs {
    a: A;
    b: B;
    init() {
        self.a = A{ foo: 10 };
        self.b = B{ bar: 20 };
    }
}