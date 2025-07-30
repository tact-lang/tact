contract TestMapForeach {
    receive() {
        // Create and fill a map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        m.set(3, 300);
        m.set(1, 100);
        m.set(2, 200);
        // Iterate over the map (should traverse in key order: 1,2,3)
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        dump(sum); // Expected output: 600
    }
}
