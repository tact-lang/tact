struct A { foo: Int; }
struct B { bar: Int; }
struct C { baz: Int; }

contract NestedMulti {
    a: A;
    b: B;
    c: C;
    
    init() {
        self.a = A{ foo: 1 };
        self.b = B{ bar: 2 };
        self.c = C{ baz: 3 };
    }
}