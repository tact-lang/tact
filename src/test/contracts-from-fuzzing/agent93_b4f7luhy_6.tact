contract UnusedGetter {
    state: Int = 5;

    receive() {}

    // Getter declared but never used
    get fun unused(): Int {
         return self.state;
    }
}
