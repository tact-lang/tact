contract MultipleOptionals {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
    receive() {
        if (self.foo != null) {
            let _ = self.foo!!;
        }
    }
}