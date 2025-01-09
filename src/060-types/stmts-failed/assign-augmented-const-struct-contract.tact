primitive Int;
trait BaseTrait { }

struct Foo {x: Int; y: Int}

contract Test {
    const foo: Foo = Foo {x: 42, y: 43};
    baz: Foo = Foo {x: 42, y: 43};

    fun bar() {
        self.baz.x += 1; // ok
        self.foo.y -= 1 // <-- trying to assign to a constant
    }
}