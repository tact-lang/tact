contract Test {
    // Map from Int to Int, not initialized explicitly
    m: map<Int, Int>;

    // Getter function that attempts to access a non-existent key (should return null)
    get fun getNonExistent(): Int? {
         return self.m.get(100);
    }

    receive() {}
}
