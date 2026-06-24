contract Test {
    state: map<Int, Int>;

    receive() {
        self.state = emptyMap();
        
        // Set an entry
        self.state.set(5, 50);
        
        // Check existence of key 5 and key 10
        dump(self.state.exists(5));  // expected output: true
        dump(self.state.exists(10)); // expected output: false
        
        // Delete key 5
        let deletionSuccess: Bool = self.state.del(5);
        dump(deletionSuccess);         // expected output: true
        
        // After deletion, key 5 should no longer exist
        dump(self.state.exists(5));    // expected output: false
        
        // Attempt to delete key 5 again
        deletionSuccess = self.state.del(5);
        dump(deletionSuccess);         // expected output: false
    }
}
