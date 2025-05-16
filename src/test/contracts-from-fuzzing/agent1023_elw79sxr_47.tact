struct Bar { x: Int }

struct Foo { bar: Bar }

contract WithDeepStruct {
    foo: Foo;
    init() {
        self.foo = Foo{ bar: Bar{ x:42 } };
    }
}