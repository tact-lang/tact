contract Test4 {
    receive() {
        // Testing iteration order on a map with unordered insertions;
        // insertion order is not preserved; iteration is in ascending order of keys.
        let m: map<Int, Int> = emptyMap();
        m.set(25, 100);
        m.set(3, 30);
        m.set(15, 70);
        
        // Expected iteration order: key=3, then 15, then 25.
        // Calculate sum: (3+30) + (15+70) + (25+100) = 33 + 85 + 125 = 243
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += (k + v);
        }
        dump(sum); // Expected output: 243
    }
}
