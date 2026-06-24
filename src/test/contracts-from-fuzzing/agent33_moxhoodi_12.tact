contract TestForeach {
    receive() {
        // Initialize a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set a couple of key-value pairs
        m.set(3, 30);
        m.set(1, 10);
        m.set(2, 20);
        
        // Iterate over the map using foreach (keys should be in ascending order)
        let sum: Int = 0;
        // In Tact, you can mutate let variables with += operator
        sum += 0; // initialize
        foreach (key, value in m) {
            // sum updated by key + value
            // Since let variables are mutable in tactical contexts
            // we reassign sum
            sum = sum + key + value;
        }
        
        // Expected order: key 1 -> 10, key 2 -> 20, key 3 -> 30; Sum = (1+10)+(2+20)+(3+30) = 66
        dump(sum);
    }
}
