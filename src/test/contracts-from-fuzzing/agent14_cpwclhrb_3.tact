contract TestMapGet {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // Set a key-value pair
        self.dict.set(1, 100);
        
        // Retrieve the value using get() with explicit unwrap (!!)
        let val: Int = self.dict.get(1)!!;
        dump(val);
    }
}
