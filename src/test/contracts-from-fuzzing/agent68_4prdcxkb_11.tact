contract TestContract {
    receive() {
        let cells: map<Int, Int> = emptyMap();
        cells.set(1, 10);
        cells.set(2, 20);
        let sum: Int = 0;
        foreach (k, v in cells) {
            sum = sum + v;
        }
        dump(sum); // Expected output: 30
    }
}
