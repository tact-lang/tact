contract TestMultiplication {
    receive() {
        // Multiplication tests
        let m1: Int = 2 * 3;       // 6
        let m2: Int = (-1) * 5;      // -5
        let m3: Int = 10 * 0;        // 0
        dump(m1);
        dump(m2);
        dump(m3);
    }
}
