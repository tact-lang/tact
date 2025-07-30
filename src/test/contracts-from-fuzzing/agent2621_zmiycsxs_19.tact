struct Foo {
    big1: Int as int257;
    big2: Int;
}

contract Test {
    foo: Foo;
    init() {
        self.foo = Foo{ big1:1, big2:2 };
    }
}