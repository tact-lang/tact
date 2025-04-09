// Contract params with nested composite type that has optionals
struct Foo {
    x: Int?;
    y: Bool;
}

contract Test(
    foo: Foo?,
    label: String,
) {
    receive() {
        let _ = self.foo;
        let _ = self.label;
    }
}
