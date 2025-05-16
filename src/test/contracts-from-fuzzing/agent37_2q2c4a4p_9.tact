contract TestMapForeach {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let sum: Int = 0;
        // Iterating in ascending order (keys 1 then 2)
        foreach (k, v in m) {
            sum += v;
        }
        dump(sum); // expected output: 30

        // Testing discarding key
        let sum2: Int = 0;
        foreach (_, v in m) {
            sum2 += v;
        }
        dump(sum2); // expected output: 30

        // Testing discarding value
        let sum3: Int = 0;
        foreach (k, _ in m) {
            sum3 += k;
        }
        dump(sum3); // expected output: 3 (1 + 2)
    }
}
