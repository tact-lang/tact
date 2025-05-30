contract Test {
    state: map<Int, Int>;

    receive() {
        self.state = emptyMap();
        
        // Initialize the map with some entries
        self.state.set(7, 70);
        self.state.set(42, 42);
        
        // Replace existing key using replaceGet; should return old value 70
        let oldVal1: Int? = self.state.replaceGet(7, 68);

        // Replace non-existing key using replaceGet; should return null
        let oldVal2: Int? = self.state.replaceGet(8, 68);
        
        dump(oldVal1); // expected output: 70
        dump(oldVal2); // expected output: null
        dump(self.state.get(7)); // expected updated value: 68
    }
}
