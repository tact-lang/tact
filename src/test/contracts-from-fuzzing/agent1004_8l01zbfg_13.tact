// contract with two nested structs sharing identical field names
struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    x: Int;
    y: Bool;
    foo: Foo;
}

contract TestContract {
    val: Bar;

    init() {
        self.val = Bar{
            x: 5,
            y: true,
            foo: Foo { x: 10, y: false }
        };
    }
}