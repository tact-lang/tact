contract ComprehensiveMapTest {

    // Test A: asCell() behavior
    // When the map is empty, asCell() should return null (adds 1)
    // When non-empty, asCell() should be non-null (adds 2)
    get fun testAsCell(): Int {
        let m1: map<Int, Int> = emptyMap();
        let result1: Int = (m1.asCell() == null) ? 1 : 0;
        let m2: map<Int, Int> = emptyMap();
        m2.set(5, 500);
        let result2: Int = (m2.asCell() != null) ? 2 : 0;
        return result1 + result2; // Expected 3
    }

    // Test B: Replace & Deletion via replaceGet()
    // Using replaceGet() on an existing key with null should delete the entry and return the old value
    get fun testReplaceDeletion(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let old: Int = m.replaceGet(1, null)!!;
        // if deletion is successful, old should be 100 and key 1 no longer exists
        return ((old == 100) && (!m.exists(1))) ? 1 : 0;
    }

    // Test C: Persistent Map Initialization
    // Persistent maps are automatically empty (null) if not explicitly set
    m: map<Int, Int> = null; // persistent map, default is null
    get fun testPersistent(): Int {
        // m is a persistent state variable and should be empty (null) by default
        return (self.m == null) ? 1 : 0;
    }

    // Test D: Iteration Order and Discard Patterns (using a separate persistent map m2)
    m2: map<Int, Int> = emptyMap();
    orderFlag: Int = 1;
    sumValues: Int = 0;
    sumKeys: Int = 0;
    orderLocalPrev: Int = -1000000000; // persistent field to simulate mutable local variable for iteration

    // Initializes m2 with keys inserted in arbitrary order and resets tracking variables
    fun initOrder() {
        self.m2 = emptyMap();
        self.m2.set(10, 100);
        self.m2.set(3, 30);
        self.m2.set(7, 70);
        self.m2.set(-1, -10);
        self.orderFlag = 1; // assume order correct
        self.sumValues = 0;
        self.sumKeys = 0;
        self.orderLocalPrev = -1000000000;
    }

    // Checks iteration order and computes sum by using discard patterns
    fun testOrderAndForeach() : Int {
        // Check iteration order: keys should appear in ascending order
        foreach (k, v in self.m2) {
            if (k < self.orderLocalPrev) {
                self.orderFlag = 0;
            }
            self.orderLocalPrev = k;
        }
        // Sum values by discarding keys
        foreach (_, v in self.m2) {
            self.sumValues = self.sumValues + v;
        }
        // Sum keys by discarding values
        foreach (k, _ in self.m2) {
            self.sumKeys = self.sumKeys + k;
        }
        // Expected: Order flag remains 1, and sum computed as:
        // Sum of values: 100 + 30 + 70 + (-10) = 190
        // Sum of keys: 10 + 3 + 7 + (-1) = 19
        // Total = 1 + 190 + 19 = 210
        return self.orderFlag + self.sumValues + self.sumKeys;
    }

    get fun testIteration(): Int {
        self.initOrder();
        return self.testOrderAndForeach();
    }

    // Test E: Deep equality on empty maps
    get fun testDeepEqualsEmpty(): Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        return (m1.deepEquals(m2)) ? 1 : 0; // Expected 1
    }

    // Test F: Shallow equality operator (==) on maps
    get fun testEqualityOperator(): Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m2.set(1, 10);
        // The result may depend on identical serialization
        return (m1 == m2) ? 1 : 0;
    }

    // Test G: replaceGet on a non-existent key should return null
    get fun testReplaceNonexistent(): Int {
        let m: map<Int, Int> = emptyMap();
        let res: Int? = m.replaceGet(7, 70);
        return (res == null) ? 1 : 0;
    }

    // Final aggregated test: Sum of tests A through G
    // Expected: A:3, B:1, C:1, D:210, E:1, F:1, G:1  -> Total = 218
    get fun testAll(): Int {
        let a: Int = self.testAsCell();
        let b: Int = self.testReplaceDeletion();
        let c: Int = self.testPersistent();
        let d: Int = self.testIteration();
        let e: Int = self.testDeepEqualsEmpty();
        let f: Int = self.testEqualityOperator();
        let g: Int = self.testReplaceNonexistent();
        return a + b + c + d + e + f + g;
    }
}
