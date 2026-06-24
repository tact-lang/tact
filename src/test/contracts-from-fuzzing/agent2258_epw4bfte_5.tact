contract ManyFieldsOpt {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    s: String = "s";
    b: Bool? = null;
    addr: Address? = null;
    receive() {
        let _ = self.addr;
    }
}