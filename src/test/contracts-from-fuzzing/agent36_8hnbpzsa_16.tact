contract TestSetNull {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        // Set key 1 to value 100
        self.m.set(1, 100);
        // Now set key 1 to null, which should delete the entry
        self.m.set(1, null);
        // Check if key 1 has been deleted: get should return null
        if (self.m.get(1) == null) {
            dump(1); // expected output: 1 (deletion confirmed)
        } else {
            dump(0);
        }
    }
}
