contract Test {
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    // Getter accessing a non-existent key in a map
    get fun getNonExistent(): Int? {
         return self.m.get(100);
    }
}
