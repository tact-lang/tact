struct Foo { a: Int }

struct Bar { b: Foo }

struct Baz { c: Bar }

contract MixedStructs {
    val: Baz;

    init() {
        self.val = Baz{ c: Bar{ b: Foo{ a:1 } } };
    }

    receive() {
        self.val = Baz{ c: Bar{ b: Foo{ a:2 } } };
    }
}