contract TestMapDel {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Attempt to delete a non-existent key
        self.m.del(1);
        
        // Set a key then delete it
        self.m.set(2, 222);
        self.m.del(2);

        // Check if map is empty
        let empty = self.m.isEmpty();
    }
}
