contract TestAsciiEscapeEqualityFixed {
    a: Int = ascii("\x41");
    b: Int = ascii("A");
    receive() {
        if (self.a == self.b) {
            let dummy: Int = 1;
        } else {
            let dummy: Int = 0;
        }
    }
}
