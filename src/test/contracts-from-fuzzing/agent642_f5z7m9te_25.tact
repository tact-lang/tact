// nested struct assigned partially initialized
struct Foo { x: Int; y: Bool; }
struct Bar { a: Foo; b: Int }

contract PartialTest {
    s: Bar;

    init() {
        self.s = Bar{ a: Foo{ x: 10, y: true }, b: 11 };
    }
}