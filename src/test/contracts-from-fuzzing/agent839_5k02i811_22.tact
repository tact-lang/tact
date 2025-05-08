struct Foo {
    bar: Int = 1;
}

contract OptionalDefault {
    val: Foo? = null;
    init() {
        self.val = Foo{};
    }
}