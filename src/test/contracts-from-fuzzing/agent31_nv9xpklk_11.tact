contract NonExistentMapGetter {
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    // Attempts to retrieve a value for a key that doesn't exist. Expected to return null.
    get fun getNonExistent(): Int? {
        return self.m.get(10);
    }
}
