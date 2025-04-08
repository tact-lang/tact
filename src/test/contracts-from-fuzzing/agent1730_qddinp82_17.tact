struct Foo { a: Int; }
struct Bar { foo1: Foo; foo2: Foo; }

contract StructArrayLike {
    f: Bar;

    init() {
        self.f = Bar{ foo1: Foo{a: 1}, foo2: Foo{a: 2} };
    }
}