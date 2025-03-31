contract Test {
    state: map<Int, Int>;

    receive() {
        self.state = emptyMap();
        self.state.set(10, 100);
        let x: Int? = self.state.get(10);
    }
}
