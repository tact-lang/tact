contract Test {
    receive() {
        // Declare a map of Int to Int and initialize it using emptyMap()
        let fizz: map<Int, Int> = emptyMap();
        
        // Set a key-value pair using the .set() method
        fizz.set(1, 42);
        
        // Check existence of the key 1 and non-existent key 2 using .exists()
        if (fizz.exists(1)) {
            // Dump the integer value stored at key 1
            dump(fizz.get(1)!!);
        } else {
            dump(0);
        }

        if (!fizz.exists(2)) {
            // Dump 0 to indicate key 2 does not exist
            dump(0);
        } else {
            dump(fizz.get(2)!!);
        }
    }
}
