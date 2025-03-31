contract FuzzMapsFurther {
    // Test 1: Set a key to a value, then set it to null via set(), so that the key is deleted
    get fun testSetNull() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(7, 70);
         m.set(7, null);
         return m.exists(7) ? 1 : 0; // expected 0 since key 7 no longer exists
    }

    // Test 2: Use replaceGet then update via set()
    get fun testReplaceThenSet() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(3, 33);
         let r = m.replaceGet(3, 44); // should return 33 and set key 3 to 44
         m.set(3, 55);            // update key 3 to 55
         return m.get(3)!!;        // expected 55
    }

    // Test 3: Multiple reassignments on the same key
    get fun testMultipleReassignments() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(1, 20);
         m.set(1, 30);
         return m.get(1)!!; // expected 30
    }

    // Test 4: Use arithmetic expressions that compute to the same key value
    get fun testArithmeticKeyDistinctions() : Int {
         let m: map<Int, Int> = emptyMap();
         let a = 2 * 3;      // 6
         let b = 10 - 4;     // 6
         m.set(a, 100);
         m.set(b, 200);      // overwrites previous entry
         return m.get(6)!!;  // expected 200
    }

    // Test 5: Equality of two empty maps
    get fun testEqualityEmptyMaps() : Int {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         return (m1 == m2) ? 1 : 0; // expected 1
    }

    // Test 6: Check shallow difference vs deepEquals for maps created with different insertion orders
    get fun testInsertionOrderEquality() : Int {
         let m1: map<Int, Int> = emptyMap();
         m1.set(1, 10);
         m1.set(2, 20);
         m1.set(3, 30);
         
         let m2: map<Int, Int> = emptyMap();
         m2.set(3, 30);
         m2.set(1, 10);
         m2.set(2, 20);
         
         // According to documentation, the equality operator performs a shallow check that may use map hash
         // while deepEquals performs a full comparison of entries.
         let deepEqual = m1.deepEquals(m2);
         let shallowEqual = (m1 == m2);
         return (deepEqual ? 100 : 0) + (shallowEqual ? 200 : 0); // expected 300 if both true
    }

    // Test 7: Reassign a key repeatedly using both set and replace
    get fun testCombinedReassignment() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(9, 90);
         m.replace(9, 99);       // replace returns true, now m[9]==99
         m.set(9, 95);           // update to 95
         let old = m.replaceGet(9, 100); // old value should be 95, now m[9]==100
         return m.get(9)!! + (old != null ? old!! : 0); // expected 100 + 95 = 195
    }

    // Test 8: Complex test using computed keys and arithmetic
    get fun testComputedKeys() : Int {
         let m: map<Int, Int> = emptyMap();
         // Compute key as (5+3)*2 = 16
         m.set((5 + 3) * 2, 160);
         // Also, key computed as 32 / 2 = 16, should overwrite
         m.set(32 / 2, 161);
         return m.get(16)!!; // expected 161
    }
}
