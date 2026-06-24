contract Test {
    receive() {
        // Testing foreach loop to traverse over map entries
        let m: map<Int, Int> = emptyMap();
        m.set(2, 20);
        m.set(5, 50);

        let sum: Int = 0;
        foreach (k, v in m) {
            sum += (k + v);
        }
        
        dump(sum); // Expected: (2+20) + (5+50) = 22 + 55 = 77
    }
}
