struct A { foo: Int; }
struct B { bar: A; }
struct C { baz: B; }
struct D { qux: C; }

contract DeepChain {
    x: D;
    init() {
        self.x = D{ qux: C{ baz: B{ bar: A{ foo: 123 } } } };
    }
}