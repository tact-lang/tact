contract Test {
    receive() {
        // Test 2: Replace method on maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Replace an existing key
        let rep1: Bool = m.replace(7, 68); // should return true and update key 7 to 68
        // Replace a non-existing key
        let rep2: Bool = m.replace(8, 68); // should return false, as key 8 doesn't exist

        // Replace using null to delete the entry
        let rep3: Bool = m.replace(42, null); // should return true, and remove key 42

        // To ensure correctness, we retrieve values
        let val7: Int = m.get(7)!!; // should be 68
        let val42: Int? = m.get(42); // should be null after deletion
    }
}
