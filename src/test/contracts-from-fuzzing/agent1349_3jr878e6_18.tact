contract OptionDefaults {
    a: Int? = null;
    b: Bool? = true;

    receive() {
        self.a = 12;
        self.b = false;
    }
}