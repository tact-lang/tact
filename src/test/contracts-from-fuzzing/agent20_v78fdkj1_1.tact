contract SingleInt {
    foo: Int = 0;

    receive() {
        self.foo = 1;
    }
}