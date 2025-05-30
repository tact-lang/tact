contract TestExists {
    receive() {
        // Test: exists() method for map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        dump(m.exists(10)); // expecting dump(true)
        dump(m.exists(5));  // expecting dump(false)
    }
}
