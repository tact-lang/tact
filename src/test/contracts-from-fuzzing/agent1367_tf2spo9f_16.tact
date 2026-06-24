struct Foo {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract ComplexNull {
    val: Foo?;

    init() {
        self.val = null;
    }
}