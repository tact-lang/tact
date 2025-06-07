struct MapBoundaryResult {
    valueZero: Int?;
    valueKey1: Int?;
    valueKey12345: Int?;
    isEmpty: Bool;
}

contract TestMapBoundaries {
    m: map<Int, Int> = emptyMap();

    init() {
        // Set keys simulating boundary-like values
        // Note: For simplicity, we use a few arbitrary values
        self.m.set(0, 0);
        self.m.set(1, 12345);
        self.m.set(12345, 67890);
    }

    get fun boundaries(): MapBoundaryResult {
        return MapBoundaryResult{
            valueZero: self.m.get(0),
            valueKey1: self.m.get(1),
            valueKey12345: self.m.get(12345),
            isEmpty: self.m.isEmpty()
        };
    }
}


// Contract to test multiple sequential operations, replacements, deletions, and reinsertions
struct MultiOpResult {
    finalVal: Int?;
    exists: Bool;
}

contract TestMapMultipleOps {
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert key 10 with value 100
        self.m.set(10, 100);
        // Replace key 10 with new value 200, expect success
        let rep1 = self.m.replace(10, 200);
        // Replace non-existing key 20, expect false
        let rep2 = self.m.replace(20, 300);
        // Use replaceGet on key 10: should return old value 200 and update it
        let oldVal = self.m.replaceGet(10, 250);
        // Now, delete key 10 by setting it to null via replaceGet, expect old value 250
        let delVal = self.m.replaceGet(10, null);
        // Reinsert key 10 with a new value 400
        self.m.set(10, 400);
    }

    get fun finalStatus(): MultiOpResult {
        return MultiOpResult{
            finalVal: self.m.get(10),
            exists: self.m.exists(10)
        };
    }
}
