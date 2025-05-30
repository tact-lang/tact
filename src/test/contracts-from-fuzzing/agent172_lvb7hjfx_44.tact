contract ParamTest(
    foo: Int
) {
    receive() {
        self.foo = self.foo + 10;
    }
}