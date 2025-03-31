contract TestMapBasic {
    receive() {
        // create an empty map with key type Int and value type Int
        let fizz: map<Int, Int> = emptyMap();
        // Set key 1 to value 100
        fizz.set(1, 100);
        // Retrieve the value associated with key 1
        let val: Int? = fizz.get(1);
    }
}
