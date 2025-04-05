struct Foo {
    x: Int;
}

contract Test {
    fun foo(): Foo {
        return Foo{ x: 7 };
    }

    receive() {
        self.foo();
    }
}