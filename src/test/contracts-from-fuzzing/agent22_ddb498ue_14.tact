struct A { foo: Int }
struct B { bar: Bool }
struct C { baz: String }

struct ABC {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    abc: ABC;

    init() {
        self.abc = ABC{
            a: A{ foo: 1 },
            b: B{ bar: false },
            c: C{ baz: "x" }
        };
    }
}
