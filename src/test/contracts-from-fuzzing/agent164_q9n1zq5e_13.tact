struct Foo {
    v: Int;
}

contract TestContract {
    data: Foo?;

    receive() {
        if (self.data != null) {
            let _ = self.data!! .v;
        }
    }
}