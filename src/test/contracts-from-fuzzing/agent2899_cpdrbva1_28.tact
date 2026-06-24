struct Foo { x: Int; }
struct Bar { y: Int; }

contract MixOfStructs {
    f: Foo;
    b: Bar;

    init() {
        self.f = Foo{ x: 1 };
        self.b = Bar{ y: 2 };
    }
}
