contract Test {
    state: map<Int, Int>;

    receive() {
        self.state = emptyMap();
        // Correct usage: call set directly, mutating the persistent map in place
        self.state.set(5, 42);
    }
}
