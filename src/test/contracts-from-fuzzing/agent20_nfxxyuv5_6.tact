contract TestMapDel {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();

        // Set some key-value pairs
        m.set(1, 10);
        m.set(2, 20);

        // Case 1: Delete an existing key
        let delSuccess1: Bool = m.del(1);
        dump(delSuccess1);  // Expected output: true
        
        // Case 2: Attempt to delete the same key again
        let delSuccess2: Bool = m.del(1);
        dump(delSuccess2);  // Expected output: false
        
        // Case 3: Delete a key by setting it to null
        m.set(2, null);
        let valueAfterDel: Int? = m.get(2);
        dump(valueAfterDel); // Expected output: null
    }
}
