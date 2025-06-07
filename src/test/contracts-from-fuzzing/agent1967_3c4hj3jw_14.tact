struct Inner {
    a: Int;
}

contract TestContract {
    foo: Inner?;

    init() {
        self.foo = null;
    }

    receive() {
        let innerVal = self.foo;
        if (innerVal != null) {
            // do something
        }
    }
}