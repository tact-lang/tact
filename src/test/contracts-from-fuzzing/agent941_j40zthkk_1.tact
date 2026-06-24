contract SinglePrimitiveField {
    number: Int = 42;

    receive() {
        self.number = 43;
    }
}