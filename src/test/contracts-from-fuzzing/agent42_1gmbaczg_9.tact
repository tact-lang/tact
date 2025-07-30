contract TestUnusedGetter {
    x: Int = 123;

    receive() {}

    // This getter is declared but never actually called from any receiver
    // It should compile without warnings or errors
    get fun unusedGetter(): Int {
        return self.x;
    }
}
