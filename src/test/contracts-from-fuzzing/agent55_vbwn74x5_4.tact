contract GetterTest {
    // Storage variable
    v: Int = 42;

    // Getter with conditional return
    get fun getDouble(): Int {
        if (self.v > 0) {
            return self.v * 2;
        } else {
            return 0;
        }
    }

    receive () {}
}
