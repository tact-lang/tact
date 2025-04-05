struct Foo {
 a: Int;
}
struct Bar {
 b: Foo;
}
struct Baz {
 c: Bar;
}

contract Test {
 receive() {}
}