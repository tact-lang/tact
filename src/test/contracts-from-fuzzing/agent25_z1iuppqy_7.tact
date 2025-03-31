contract GetterNonExistent {
    m: map<Int, Int>;
    
    // No explicit initialization, persistent state variables default to an empty map
    receive() {}
    
    // Getter trying to retrieve a non-existent key from the map
    get fun get_non_existent(): Int? {
         return self.m.get(999);
    }
}
