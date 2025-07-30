contract AdvancedMapEdgeCases {
    // Test: Replace an entry with null using replaceGet
    get fun testReplaceWithNull() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 123);
        let old = m.replaceGet(10, null);
        // After replaceGet, key 10 is deleted, so exists(10) is false
        return (old != null ? old!! : 0) + (m.exists(10) ? 10 : 0);  // expected 123
    }

    // Test: Computed key precedence - different arithmetic expressions
    get fun testComputedKeyPrecedence() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set((2 + 3) * 2, 50);  // (5 * 2) = 10
        m.set(2 + (3 * 2), 70);   // 2 + 6 = 8
        return m.get(10)!! + m.get(8)!!;  // expected 50 + 70 = 120
    }

    // Test: Null comparison - empty maps compare equal to null
    get fun testNullComparisonEmpty() : Int {
        let m: map<Int, Int> = emptyMap();
        return (m == null) ? 1 : 0;  // expected 1
    }

    // Test: Multiple reassignments and iteration - sum values
    get fun testMultipleReassignmentsIteration() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(1, 20);
        m.set(1, 30);
        m.set(2, 40);
        m.set(2, 50);
        let sum = 0;
        foreach (k, v in m) {
            sum = sum + v;
        }
        return sum;  // expected 30 + 50 = 80
    }

    // Test: Optional chaining with map get
    get fun testOptionalChain() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 777);
        return m.get(7)!! + 1;  // expected 777 + 1 = 778
    }

    // Test: Update using arithmetic expressions that produce the same key
    get fun testUpdateArithmetic() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(15 - 5, 100);  // key = 10
        m.set(20 / 2, 150);   // key = 10, overwrites previous value
        return m.get(10)!!;   // expected 150
    }
}
