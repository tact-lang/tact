contract MapIteration {
    // Persistent state variable map
    fizz: map<Int, Int>;

    // Constructor to initialize the map
    init() {
        self.fizz = emptyMap();
        self.fizz.set(10, 100);
        self.fizz.set(20, 200);
    }

    // A getter that iterates over the map using foreach to sum all values
    get fun sumValues(): Int {
        let sum: Int = 0;
        foreach (k, v in self.fizz) {
            sum = sum + v;
        }
        return sum;
    }
}
