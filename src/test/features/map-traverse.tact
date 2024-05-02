contract MapTraverseTestContract {
    init() {
        // Nothing to do
    }

    receive() {
        // Nothing to do
    }

    get fun test1(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        m.set(4, 400);

        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }

        return sum;
    }
}