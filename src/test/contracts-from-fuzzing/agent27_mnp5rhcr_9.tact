contract Test {
    // Valid use of mapping iteration with wildcards to discard values
    myMap: map<Int, Int> = emptyMap();
    
    receive() {
       // Valid: Key is used; Value is discarded using wildcard syntax
       foreach (key, _ in self.myMap) {
           dump(key);
       }
    }
}
