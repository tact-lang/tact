struct Foo {
    id: Int;
}

contract OptionalStructLateAssign {
    foo: Foo?;

    receive() {
        self.foo = Foo{ id: 123 };
        if (self.foo != null) {
            let _ = self.foo!!.id;
        }
    }
}