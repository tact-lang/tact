contract OptionalIntDefaults {
    i1: Int? = null;
    i2: Int? = 0;
    i3: Int? = 42;

    init() {
        self.i1 = null;
        self.i2 = null;
        self.i3 = null;
    }

    receive() {
        let _ = self.i1;
        let _ = self.i2;
        let _ = self.i3;
    }
}