struct EqualityResult {
    shallow: Bool;
    deep: Bool;
}

struct ReplaceResult {
    val: Int?;
    exists: Bool;
}

struct AsCellResult {
    cell: Cell?;
}

contract TestMapComplete {
    // Persistent map state variables
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();
    m3: map<Int, Int> = emptyMap();
    mEmpty: map<Int, Int> = emptyMap();

    init() {
        // Initialize m1 with keys in order: 1 then 2
        self.m1.set(1, 10);
        self.m1.set(2, 20);

        // Initialize m2 with keys in reverse order: 2 then 1
        self.m2.set(2, 20);
        self.m2.set(1, 10);

        // For m3, perform replacements and deletions
        self.m3.set(5, 50);
        // Replace existing key 5 with a new value 55 (should succeed)
        let _ = self.m3.replace(5, 55);
        // Attempt to replace non-existent key 6 (should return false, but we don't capture its return here)
        let _ = self.m3.replace(6, 66);
        // Replace key 5 with null, which should delete it
        let _ = self.m3.replace(5, null);
    }

    // Getter to test equality of m1 and m2
    // Shallow equality (==) may produce different result than deepEquals
    get fun testEquality(): EqualityResult {
        return EqualityResult{
            shallow: self.m1 == self.m2,
            deep: self.m1.deepEquals(self.m2)
        };
    }

    // Getter to test replacement result on m3
    // After deletion, key 5 should not exist
    get fun testReplacement(): ReplaceResult {
        return ReplaceResult{
            val: self.m3.get(5),
            exists: self.m3.exists(5)
        };
    }

    // Getter to test asCell on an empty map (mEmpty)
    get fun testEmptyAsCell(): AsCellResult {
        return AsCellResult{ cell: self.mEmpty.asCell() };
    }
}
