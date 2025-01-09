primitive Int;

struct Foo {x: Int; y: Int}

const foo: Foo = Foo {x: 42, y: 43};

fun bar() {
    let baz: Foo = Foo {x: 42, y: 43};
    baz.x += 1; // ok
    foo.y -= 1 // <-- trying to assign to a constant
}