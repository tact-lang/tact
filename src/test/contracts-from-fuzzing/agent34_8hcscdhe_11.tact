contract Test {
    // Persistent map fuzz-test: testing .set, .exists, .del on a persistent map
    m: map<Int, Int>;

    init() {
        // Persistent state variable 'm' auto-initialized to empty
    }

    receive() {
        // Test setting and retrieving values
        self.m.set(1, 100);
        dump(self.m.get(1)!!); // Expected output: 100

        // Test existence
        let exists1: Bool = self.m.exists(1);
        let exists2: Bool = self.m.exists(2);
        dump(exists1); // Expected: true
        dump(exists2); // Expected: false

        // Test deletion
        let delRet: Bool = self.m.del(1);
        dump(delRet);         // Expected: true
        dump(self.m.exists(1)); // Expected: false

        // Add additional values
        self.m.set(15, 150);
        self.m.set(3, 30);
        self.m.set(27, 270);

        // Iterate over persistent map: keys should be in ascending order
        foreach (key, value in self.m) {
            dump(key);
        }
    }
}
