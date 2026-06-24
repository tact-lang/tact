contract TestReplaceGet {
    receive() {
        // Setup map<Int, Int> and test replaceGet
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        
        // Case 1: Replacing an existing key returns old value
        let oldVal: Int? = m.replaceGet(7, 68); // should return 70
        dump(oldVal);  // expecting dump(70)
        
        // Case 2: Replacing a non-existing key returns null
        let nonExist: Int? = m.replaceGet(8, 68);
        dump(nonExist); // expecting dump(null)
    }
}
