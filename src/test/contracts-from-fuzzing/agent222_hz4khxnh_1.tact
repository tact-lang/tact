contract SinglePersists {
    foo: Int = 1;

    receive() {
        self.foo = 2;
    }
}