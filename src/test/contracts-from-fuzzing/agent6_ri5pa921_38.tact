struct Foo { x: Int }

struct NestedStruct { inner: map<Int, Int> }

contract FuzzMapsContinued3 {
    // Test 1: Ensure that reassigning via set() does not alter deepEquals in unexpected ways
    get fun testReassignmentDeepEquals() : Int {
         let m1: map<Int, Int> = emptyMap();
         m1.set(10, 100);
         m1.set(20, 200);
         let m2: map<Int, Int> = emptyMap();
         m2.set(20, 200);
         m2.set(10, 100);
         let initialDeep = m1.deepEquals(m2) ? 100 : 0;
         m1.set(10, 110);
         let afterDeep = m1.deepEquals(m2) ? 0 : 50;
         return initialDeep + afterDeep; // expected 150
    }

    // Test 2: Delete an entry with set(null) and then reinsert
    get fun testDeleteAndReinsert() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(5, 500);
         m.set(6, 600);
         m.set(5, null);
         let existsAfterDelete = m.exists(5) ? 1 : 0; // expected 0
         m.set(5, 555);
         let valueAfterInsert = m.get(5)!!; // expected 555
         return existsAfterDelete + valueAfterInsert; // expected 555
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

    // Test 6: Insertion order equality
    get fun testInsertionOrderEquality() : Int {
         let a: map<Int, Int> = emptyMap();
         a.set(1, 10);
         a.set(2, 20);
         a.set(3, 30);
         let b: map<Int, Int> = emptyMap();
         b.set(3, 30);
         b.set(1, 10);
         b.set(2, 20);
         return (a.deepEquals(b) && (a == b)) ? 1 : 0; // expected 1
    }

    // Test 7: Reassign a key repeatedly using set and replace
    get fun testCombinedReassignment() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(9, 90);
         m.replace(9, 99);       // now m[9] == 99
         m.set(9, 95);           // update to 95
         let old = m.replaceGet(9, 100); // old value should be 95, now m[9]==100
         return m.get(9)!! + (old != null ? old!! : 0); // expected 195
    }

    // Test 8: Complex test using computed keys and arithmetic
    get fun testComputedKeys() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set((5 + 3) * 2, 160); // key = 16
         m.set(32 / 2, 161);      // key = 16, overwrites previous entry
         return m.get(16)!!;      // expected 161
    }

    // Test 9: Using a map with a struct as value; nested map inside the struct
    get fun testNestedStructMap() : Int {
         let m: map<Int, NestedStruct> = emptyMap();
         let ns: NestedStruct = NestedStruct{ inner: emptyMap() };
         ns.inner.set(1, 111);
         m.set(42, ns);
         return (m.get(42)!!).inner.get(1)!!; // expected 111
    }

    // Test 10: Verify replace() behavior after delete and insert
    get fun testReplaceAfterDelete() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(8, 80);
         m.set(8, null);
         m.set(8, 88);
         let rep = m.replace(8, 99); // returns true if key exists
         return m.get(8)!! + (rep ? 10 : 0); // expected 109
    }

    // Test 11: Map with struct as value; verify nested keys work
    get fun testMapStruct() : Int {
         let m: map<Int, Foo> = emptyMap();
         m.set(1, Foo{ x: 10 });
         return (m.get(1)!!).x; // expected 10
    }

    // Test 12: Map with boolean values
    get fun testMapBool() : Int {
         let m: map<Int, Bool> = emptyMap();
         m.set(5, true);
         return m.get(5)!! ? 1 : 0; // expected 1
    }

    // Test 13: Map with Cell values
    get fun testMapCell() : Int {
         let m: map<Int, Cell> = emptyMap();
         let c = beginCell().storeUint(42, 8).endCell();
         m.set(1, c);
         let c2 = m.get(1)!!;
         let num = c2.beginParse().loadUint(8);
         return num; // expected 42
    }

    // Test 14: Map with Address as key type
    get fun testMapAddress() : Int {
         let m: map<Address, Int> = emptyMap();
         m.set(myAddress(), 42);
         return m.get(myAddress())!!;
    }

    // Test 15: Iteration summing values
    get fun testIterationDiscard() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         let s = 0;
         foreach (k, value in m) {
             s = s + value;
         }
         return s; // expected 30
    }

    // Test 16: Map with negative keys
    get fun testNegativeKeys() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(-5, -50);
         return m.get(-5)!!; // expected -50
    }

    // Test 17: Integer division for key expressions (1/2 equals 0)
    get fun testFractionKey() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1 / 2, 111);
         return m.get(0)!!; // expected 111
    }
}
