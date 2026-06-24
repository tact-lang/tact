contract Test {
    fun hidden() {
        // does nothing
    }

    receive() {
        // Test dump with void return from a contract function (self.hidden())
        dump(self.hidden());
    }
}
