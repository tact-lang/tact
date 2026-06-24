// Test 1: Replace with null value deletes the key
contract TestReplaceNull {
    state: map<Int, Int>;

    receive() {
        self.state = emptyMap();
        self.state.set(7, 70);
        
        // Replace key 7 with null should delete the entry
        let replaced: Bool = self.state.replace(7, null);
        dump(replaced);          // expected: true
        dump(self.state.exists(7)); // expected: false
    }
}
