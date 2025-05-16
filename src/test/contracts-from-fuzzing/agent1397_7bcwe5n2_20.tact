contract TestContract {
    foo: Int?;

    init() {
        self.foo = null;
    }

    receive() {
        if (self.foo != null) {
            let x = self.foo!!;
            let _ = x + 1;
        }
    }
}