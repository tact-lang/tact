contract UnusedGetter {
    v: Int = 100;

    receive() {}

    // Getter function that is declared but never externally used
    get fun neverCalled(): Int {
         return self.v + 1;
    }
}
