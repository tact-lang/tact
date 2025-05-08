contract FuzzMapsAdvanced2 {

    // Test: Check that an empty map is empty
    get fun testIsEmptyMap() : Int {
         let m: map<Int, Int> = emptyMap();
         return m.isEmpty() ? 1 : 0; // expected 1
    }

    // Test: Check that a map is not empty after an insertion
    get fun testIsEmptyAfterInsert() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(3, 33);
         return m.isEmpty() ? 0 : 1; // expected 1
    }

    // Test: Compare an empty map to null
    get fun testNullComparison() : Int {
         let m: map<Int, Int> = emptyMap();
         // As documented, empty maps compare equal to null
         return (m == null) ? 1 : 0; // expected 1
    }

    // Test: Iteration over an empty map should yield zero iterations
    get fun testIterationOverEmpty() : Int {
         let cnt = 0;
         let m: map<Int, Int> = emptyMap();
         foreach (k, v in m) {
             cnt = cnt + 1;
         }
         return cnt; // expected 0
    }

    // Test: replaceGet on an existing key
    get fun testReplaceGetExisting() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(10, 100);
         let old = m.replaceGet(10, 200); // should return 100, update key 10 to 200
         return (old != null ? old!! : 0) + m.get(10)!!; // expected 100 + 200 = 300
    }

    // Test: Compute a complex key and retrieve its value
    get fun testComputedKeyComplex() : Int {
         let key = ((1 + 2) * 3) - 1; // (3*3)-1 = 8
         let m: map<Int, Int> = emptyMap();
         m.set(key, 888);
         return m.get(8)!!; // expected 888
    }

    // Test: Verify shallow equality and deepEquals on two maps with same elements inserted in different order
    get fun testEmptyAndOrderEquality() : Int {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         m1.set(1, 10);
         m1.set(2, 20);
         m2.set(2, 20);
         m2.set(1, 10);
         // Both shallow and deep equality should yield true
         return (m1 == m2) && (m1.deepEquals(m2)) ? 1 : 0; // expected 1
    }

    // Test: Sum both keys and values in a map
    get fun testSumKeysAndValues() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(3, 30);
         m.set(5, 50);
         let total = 0;
         foreach (k, v in m) {
             total = total + k + v;
         }
         // Expected: (3+30)+(5+50) = 33+55 = 88
         return total;
    }

    // Test: Verify map accumulation over multiple updates
    get fun testAccumulation() : Int {
         let m: map<Int, Int> = emptyMap();
         // Insert some values and update them
         m.set(1, 10);
         m.set(2, 20);
         m.set(3, 30);
         m.set(2, 25); // update key 2
         m.set(1, null); // delete key 1
         // Sum remaining values
         let sum = 0;
         foreach (k, v in m) {
             sum = sum + v;
         }
         // Expected: key 2:25, key 3:30, so sum = 55
         return sum;
    }

    // Test: Verify that replace on a non-existing key returns false
    get fun testReplaceNonExisting() : Int {
         let m: map<Int, Int> = emptyMap();
         let rep = m.replace(7, 77); // key 7 does not exist
         return rep ? 1 : 0; // expected 0
    }

    // Test: asCell() behavior on empty vs non-empty map
    get fun testAsCellBehavior() : Int {
         let m: map<Int, Int> = emptyMap();
         let cellEmpty = m.asCell();
         m.set(7, 77);
         let cellNonEmpty = m.asCell();
         return ((cellEmpty == null) && (cellNonEmpty != null)) ? 1 : 0; // expected 1
    }

}
