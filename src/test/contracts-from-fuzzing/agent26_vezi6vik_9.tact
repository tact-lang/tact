contract MapReplaceTest {
    m: map<Int, Int> = emptyMap();

    init() {
        // Initialize map with two entries
        self.m.set(7, 70);
        self.m.set(42, 42);
    }

    // Test the replace() method: should return true when key exists, and false otherwise
    get fun testReplace() : Bool {
        let replaced1: Bool = self.m.replace(7, 68); // key exists, value changed
        if (!replaced1) { return false; }
        if (self.m.get(7)!! != 68) { return false; }
        let replaced2: Bool = self.m.replace(8, 68); // key doesn't exist
        return (!replaced2);
    }

    // Test the replaceGet() method: returns old value when key exists, null otherwise
    get fun testReplaceGet() : Int? {
        let oldVal1: Int? = self.m.replaceGet(7, 80); // should return 68
        let oldVal2: Int? = self.m.replaceGet(8, 100); // key doesn't exist, should be null
        return oldVal1; // for testing purposes, we return the old value for key 7
    }

    // Test deletion by setting value to null via .set()
    get fun testSetDeletion() : Bool {
        self.m.set(42, null); // should delete key 42
        return (self.m.get(42) == null);
    }
}
