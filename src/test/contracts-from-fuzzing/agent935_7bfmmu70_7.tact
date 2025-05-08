struct Foo {
    a: Int;
}

struct Bar {
    fooOpt: Foo?;
    intOpt: Int?;
    boolOpt: Bool?;
}

contract Mix {
    val: Bar;

    init() {
        self.val = Bar{
            fooOpt: Foo{ a: 1 },
            intOpt: null,
            boolOpt: true,
        };
    }
    receive() {}
}