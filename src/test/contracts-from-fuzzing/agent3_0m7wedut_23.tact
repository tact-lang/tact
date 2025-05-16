struct Sums {
    sum_keys: Int;
    sum_vals: Int;
}

contract TestMapForeachUnderscoreFixed {
    sum_keys: Int = 0;
    sum_vals: Int = 0;
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert several entries into the map
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);

        // Reset accumulators
        self.sum_keys = 0;
        self.sum_vals = 0;

        // Iterate over map, discarding the value; accumulate the keys
        foreach (k, _ in self.m) {
            self.sum_keys = self.sum_keys + k;
        }
        // Iterate over map, discarding the key; accumulate the values
        foreach (_, v in self.m) {
            self.sum_vals = self.sum_vals + v;
        }

        // Check that the summations are as expected: keys: 1+2+3 = 6, values: 10+20+30 = 60
        if (self.sum_keys != 6) {
            throw(101);
        }
        if (self.sum_vals != 60) {
            throw(102);
        }
    }

    get fun getSums() : Sums {
        return Sums { sum_keys: self.sum_keys, sum_vals: self.sum_vals };
    }
}
