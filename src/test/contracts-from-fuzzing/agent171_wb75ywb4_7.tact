struct A { foo: Int; b: B }
struct B { bar: Int; c: C }
struct C { baz: Int }

contract DeepChain {
    field: A;
    init() {
        self.field = A{ foo:1, b: B{ bar:2, c: C{ baz:3 }}};
    }
}