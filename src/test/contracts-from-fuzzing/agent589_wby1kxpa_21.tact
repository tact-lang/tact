struct Foo {
    bar: Int = 5;
    baz: String = "hi";
}

contract Defaults {
    val: Foo;

    init() {
        self.val = Foo{};
    }
}