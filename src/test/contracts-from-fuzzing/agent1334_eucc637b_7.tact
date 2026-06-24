struct A { foo: Int }
struct B { bar: A }
struct C { baz: B }
struct D { qux: C }

contract Chain {
    val: D;

    init() {
        self.val = D{ qux: C{ baz: B{ bar: A{ foo: 123 } } } };
    }
}