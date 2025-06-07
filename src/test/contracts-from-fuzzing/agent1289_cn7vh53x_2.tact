struct Foo { a: Int; }
struct Bar { x: Int; y: Foo; z: Bool; }

contract ContractTest {
    nested: Bar;

    init() {
        self.nested = Bar{ x: 10, y: Foo{ a: 20 }, z: false };
    }
}
