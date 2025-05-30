contract TestMapIteration {
    m: map<Int, Int>;

    init() {
        // Persistent state variable of map type is initialized empty by default
        self.m.set(1, 100);
        self.m.set(2, 200);
    }

    receive() {
        let sum: Int = 0;
        // Valid iteration over a contract state variable map
        foreach (k, v in self.m) {
            sum += v;
        }
        dump(sum); // Expected output: 300
    }
}
