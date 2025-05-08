struct Foo {
    a: Int = 0;
}

contract NullTest {
    bar: Foo? = null;

    init() {
        self.bar = Foo{ a: 10 };
    }
}