contract MapIterationTestFixed() {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 1);
        m.set(3, 1);
        m.set(10, 1);
        m.set(2, 1);
        let sum = 0;
        foreach (k, v in m) {
            sum += k;
        }
        require(sum == 22, "Map iteration error");
        dump(sum);
        cashback(sender());
    }
}
