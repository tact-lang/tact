contract DeepVsShallow2 {
    m1: map<Int as uint8, Int as uint8>;
    m2: map<Int as uint8, Int as uint8>;

    init() {
         self.m1 = emptyMap();
         self.m2 = emptyMap();
         
         // Insert the same key-value pair into both maps.
         // Use key 1 and value within 0-255, e.g. 255
         self.m1.set(1, 255);
         self.m2.set(1, 255);
    }

    // deepEquals should return true as both maps logically contain the same entry
    get fun testDeepEquals(): Bool {
        return self.m1.deepEquals(self.m2);
    }

    // Shallow equality (==) might return false if underlying serialization differs
    get fun testShallowEquals(): Bool {
        return self.m1 == self.m2;
    }
}
