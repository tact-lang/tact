struct Foo {
    val: Int;
}

contract InlineStructInit {
    f: Foo;
    init() {
        self.f = Foo{val: 12};
    }
}