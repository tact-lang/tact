struct Foo {
    value: Int = 7;
}

contract DefaultStruct {
    bar: Foo;

    init() {
        self.bar = Foo{};
    }
}