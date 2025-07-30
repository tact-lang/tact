struct Example {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: Example? = null;

    receive() {
        if (self.data != null) {
            let _ = self.data!! .foo;
        }
    }
}