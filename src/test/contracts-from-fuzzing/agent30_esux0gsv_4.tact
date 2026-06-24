contract Test {
    last: String = "";

    // Arbitrary text receiver using String parameter
    receive(str: String) {
        self.last = str;
    }
}
