struct Foo {
    bar: Int = 1;
    baz: String?;
}

contract OmitOptNested {
    test: Foo?;

    init() {
        self.test = null;     // explicit null
    }

    receive() {
        let _ = self.test;
    }
}