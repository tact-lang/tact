struct Inner1 { foo: Int }
struct Inner2 { bar: Inner1 }
struct Inner3 { baz: Inner2 }

struct Outermost {
    v1: Inner1;
    v2: Inner2;
    v3: Inner3;
}

contract TestContract {
    s: Outermost;

    init() {
        self.s = Outermost{
            v1: Inner1{ foo: 10 },
            v2: Inner2{ bar: Inner1{ foo: 20 } },
            v3: Inner3{ baz: Inner2{ bar: Inner1{ foo: 30 } } },
        };
    }
}
