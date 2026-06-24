contract TestPersistentMap {
    // Persistent map declared as a state variable
    m: map<Int, Int>;

    // The init function is optional since persistent maps are initialized empty by default
    init() {
        // (Optional) self.m = emptyMap();
    }

    receive() {
        // Set a value in the persistent map
        self.m.set(2, 200);
        let x: Int? = self.m.get(2);
        // Dump the value, expecting 200
        dump(x!!);

        // Delete the key by setting its value to null
        self.m.set(2, null);
        let y: Int? = self.m.get(2);
        // If deletion succeeded, y should be null
        if (y == null) {
            dump(42); // indicator for deletion success
        } else {
            dump(0);
        }
    }
}
