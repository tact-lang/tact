contract TestMapAddressBool {
    // Using Address as key and Bool as value
    m: map<Address, Bool> = emptyMap();

    receive() {
        // Set the sender's address with value true
        self.m.set(context().sender, true);
        
        // Check existence; expected true
        dump(self.m.exists(context().sender));
        
        // Replace the value for the sender's address with false, should return the old value
        let oldVal: Bool? = self.m.replaceGet(context().sender, false);
        if (oldVal != null) {
            dump(oldVal!!); // Expected: true
        } else {
            dump(false);
        }
        
        // Verify the new value
        dump(self.m.get(context().sender)!!); // Expected: false
        
        // Remove the key by replacing with null
        let removed: Bool? = self.m.replaceGet(context().sender, null);
        if (removed != null) {
            dump(removed!!); // Expected: false
        } else {
            dump(false);
        }
        
        // Now key should not exist
        dump(self.m.exists(context().sender)); // Expected: false
    }
}
