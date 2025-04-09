struct Foo {
    x: Int;
}

contract OptionalAfterDefault {
    x: Int = 5;
    y: Foo?;

    init() {
        self.y = null;
    }
}