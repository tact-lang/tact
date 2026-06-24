struct Foo { a: Int; }
struct Bar { b: Int; }

contract OrderTest {
    f: Foo;
    b: Bar;

    init() {
        self.b = Bar{ b: 2 };
        self.f = Foo{ a: 1 };
    }
}