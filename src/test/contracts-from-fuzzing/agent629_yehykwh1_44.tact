// optional of struct
struct Foo {
    bar: Int;
}

contract Test {
    foo: Foo?;
    init() {
        self.foo = null;
    }
}
