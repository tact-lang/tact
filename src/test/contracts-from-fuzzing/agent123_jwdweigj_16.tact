struct A { foo: Int; }
struct B { bar: A; }
struct C { baz: B; }
contract NestedDeeper {
    s: C;

    init() {
        self.s = C{ baz: B{ bar: A{ foo: 7 } } };
    }
}