contract TestAscii {
    a: Int = ascii("a");
    b: Int = ascii("⚡");

    receive() {
        self.a;
        self.b;
    }
}
