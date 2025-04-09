struct Foo {x: Int}
struct Bar {foo: Foo}
struct Baz {bar: Bar}

struct MainS {
    baz1: Baz;
    baz2: Baz;
}

contract WideDeep {
    s: MainS;

    init() {
        self.s = MainS{
            baz1: Baz{ bar: Bar{ foo: Foo{ x:1 } } },
            baz2: Baz{ bar: Bar{ foo: Foo{ x:2 } } },
        };
    }
}