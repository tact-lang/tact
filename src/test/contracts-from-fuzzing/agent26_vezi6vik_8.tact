contract MapIterationTest {
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert some key-value pairs
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
    }

    // A getter that dumps keys using the underscore discard syntax
    get fun dumpKeys() : Int {
        foreach (key, _ in self.m) {
            dump(key);
        }
        return 0;
    }

    // A getter that dumps the sum of key and value for each entry
    get fun dumpEntries() : Int {
        foreach (key, value in self.m) {
            dump(key + value);
        }
        return 0;
    }
}
