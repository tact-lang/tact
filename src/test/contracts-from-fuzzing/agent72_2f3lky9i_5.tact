contract Test {
    flag: Bool = true;

    receive() {
        // Test augmented logical assignment operators
        self.flag &&= false;
        dump(self.flag);
        self.flag ||= true;
        dump(self.flag);
    }
}
