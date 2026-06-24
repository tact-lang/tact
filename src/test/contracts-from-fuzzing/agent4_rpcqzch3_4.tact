contract Test {
    m: map<Int, Int>;

    receive() {
        // Initialize the persistent map variable
        self.m = emptyMap();
        
        // Set key-value pair using .set() method which does not return a new map
        self.m.set(1, 42);
        
        // Retrieve the value for key 1 and dump it
        let value: Int = self.m.get(1)!!;
        dump(value);
    }
}
