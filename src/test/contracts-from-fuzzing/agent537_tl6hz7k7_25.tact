contract TestContract {
    sval: String = "hello";
    bval: Bool = false;
    ival: Int = 123;

    receive() {
        self.sval = self.sval;
        self.bval = self.bval;
        self.ival = self.ival;
    }
}
