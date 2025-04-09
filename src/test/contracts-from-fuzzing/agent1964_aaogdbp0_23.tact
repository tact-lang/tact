struct Foo { x: Int }
struct Bar { y: Int }

contract MixedOptionals {
    a: Foo?;
    b: Bar;
    c: Foo?;

    init() {
        self.a = null;
        self.b = Bar{ y: 7 };
        self.c = null;
    }
}