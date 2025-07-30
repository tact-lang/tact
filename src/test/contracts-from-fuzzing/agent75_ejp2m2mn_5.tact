contract TestMapValid {
    fun test() {
        // Create an empty map from Int to Int
        let m: map<Int, Int> = emptyMap();
        // Set value 100 for key 1
        m.set(1, 100);
        // Retrieve the value for key 1 with non-null assertion
        let x = m.get(1)!!; // should be 100
        dump(x);

        // Check existence of a key that was not set
        let existsKey2 = m.exists(2);
        dump(existsKey2); // false

        // Replace the key 1 value with 200
        m.replaceGet(1, 200);
        let newVal = m.get(1)!!; // should be 200 now
        dump(newVal);

        // Delete key 1 and verify map is empty
        m.del(1);
        dump(m.isEmpty()); // should be true
    }
    
    // Dummy receiver to force contract compilation
    receive() {}
}
