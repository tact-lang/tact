struct Foo { a: Int; }
struct Bar { b: Foo; }
struct Baz { c: Bar; }
struct Qux { d: Baz; }

contract Test {
    q: Qux = Qux{d: Baz{c: Bar{b: Foo{a: 0}}}};
    init() {
        self.q = Qux{d: Baz{c: Bar{b: Foo{a: 42}}}};
    }
}