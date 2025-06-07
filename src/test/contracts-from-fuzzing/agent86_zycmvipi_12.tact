contract TestContract {
    // Use compile-time constant in state initialization
    a: Int = ascii("hello");

    receive() {
        dump(self.a);
    }
}
