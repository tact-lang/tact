contract Test {
    state: Int = 0;

    receive() {
        self.state = 1;
    }

    // dummy function to force compilation
    fun getState(): Int {
        return self.state;
    }
}
