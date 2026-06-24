contract TestMapDoUntilLoop {
    receive() {
        // Testing map population using a do...until loop
        // This loop should run at least once, inserting values 0*10, 1*10, 2*10, 3*10, 4*10
        let m: map<Int, Int> = emptyMap();
        let i: Int = 0;
        do {
            m.set(i, i * 10);
            i = i + 1;
        } until (i >= 5);
        
        // Iterate over the map and sum the values.
        // Expected sum: 0 + 10 + 20 + 30 + 40 = 100
        let sum: Int = 0;
        foreach (k, v in m) {
            sum = sum + v;
        }
        dump(sum); // Should dump 100
    }
}
