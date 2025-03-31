contract Test {
    state: Int = 0;

    receive(msg: Slice) {
        self.state = 5;
    }

    fun getState(): Int {
        return self.state;
    }
}
