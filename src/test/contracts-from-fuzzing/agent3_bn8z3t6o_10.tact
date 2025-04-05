contract Test {
    const my_const: Int = 123;

    receive() {
        dump(self.my_const);
    }
}
