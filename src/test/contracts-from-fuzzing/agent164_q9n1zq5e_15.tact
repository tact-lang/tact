struct Foo {
    a: Int;
    b: String?;
}

contract TestContract {
    foo: Foo = Foo{ a: 7, b: null };

    receive() {
        let _ = self.foo.b;
    }
}