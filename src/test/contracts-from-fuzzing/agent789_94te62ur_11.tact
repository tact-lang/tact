struct Foo { a: Int; b: Bool; }
struct Bar { x: Int; y: Bool; }

contract MultiStructsTest {
    fooField: Foo;
    barField: Bar;

    init() {
        self.fooField = Foo { a: 1, b: true };
        self.barField = Bar { x: 2, y: false };
    }
}
