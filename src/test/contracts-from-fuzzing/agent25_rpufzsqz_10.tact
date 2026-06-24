contract TestForEach {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        dump(sum); // expected output: 60
    }
}
