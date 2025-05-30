struct A { foo: Int }
struct B { bar: Int }
struct C { baz: Int }

contract LongList {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ foo: 10 };
        self.b = B{ bar: 20 };
        self.c = C{ baz: 30 };
    }
}