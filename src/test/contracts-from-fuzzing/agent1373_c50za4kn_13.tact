struct Foo {
    ix: Int;
}

struct Bar {
    left: Foo?;
    right: Foo?;
}

contract Test {
    pair: Bar;

    init() {
        self.pair = Bar{
            left: null,
            right: Foo{ ix: 777 }
        };
    }
}