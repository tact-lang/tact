contract BoolOptDefault {
    b: Bool?;

    receive() {
        self.b = null;
    }
}