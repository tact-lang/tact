// Comprehensive fuzz-testing for maps in Tact

// Snippet 1: Valid map<Int, Int> operations (set, replace, get)
contract TestMapValid {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.replace(1, 20);
         return m.get(1)!!; // Expected: 20
    }
}

// Snippet 2: Test replaceGet behavior (deletion when passing null)
contract TestMapReplaceGet {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(5, 50);
         let old = m.replaceGet(5, null); // deletes key 5, returns old value
         return old!!; // Expected: 50
    }
}

// Snippet 3: Test invalid key type (Bool not allowed) - Expected to produce compile error
contract TestInvalidMapKey {
    // Uncommenting this will produce compile error
    // get fun test(): Int {
    //      let m: map<Bool, Int> = emptyMap();
    //      m.set(true, 100);
    //      return m.get(true)!!;
    // }
}

// Snippet 4: Test invalid value type (String not allowed) - Expected to produce compile error
contract TestInvalidMapValue {
    // Uncommenting this will produce compile error
    // get fun test(): String {
    //      let m: map<Int, String> = emptyMap();
    //      m.set(1, "hello");
    //      return m.get(1)!!;
    // }
}

// Snippet 5: Test map with serialized key and value (Int as uint8)
struct SerializedMap {
    counters: map<Int as uint8, Int as uint8>
}

contract TestSerializedMap {
    get fun test(): Int {
         let sm: SerializedMap = SerializedMap{ counters: emptyMap() };
         sm.counters.set(10, 20);
         return sm.counters.get(10)!!; // Expected: 20
    }
}

// Snippet 6: Test nested maps using allowed types
struct Inner {
    data: map<Int, Int>
}

struct Outer {
    inner: map<Address, Inner>
}

contract TestNestedMaps {
    get fun test(): Int {
         let outer: Outer = Outer { inner: emptyMap() };
         let inner: Inner = Inner { data: emptyMap() };
         inner.data.set(7, 77);
         outer.inner.set(myAddress(), inner);
         return outer.inner.get(myAddress())!!.data.get(7)!!; // Expected: 77
    }
}

// Snippet 7: Test asCell() behavior on an empty map
contract TestAsCell {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         let c: Cell? = m.asCell();
         // Since m is empty, asCell() should return null
         return c == null ? 100 : 0;  // Expected: 100
    }
}

// Snippet 8: Test invalid serialization spec on key - variable integer type not allowed
contract TestInvalidSerialization {
    // Uncommenting this snippet will produce a compile error as 'var' is not allowed for key types
    // get fun test(): Int {
    //      let m: map<Int as var, Int> = emptyMap();
    //      m.set(1, 10);
    //      return m.get(1)!!;
    // }
}

// Snippet 9: Test .exists() method on maps
contract TestMapExists {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         if (m.exists(1)) {
            return 1; // Expected: 1 (true)
         }
         return 0;
    }
}

// Snippet 10: Test .del() method on maps
contract TestMapDel {
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         let _ = m.del(1); // delete key 1
         return m.exists(1) ? 0 : 1; // Expected: 1 since key 1 has been deleted
    }
}

// Snippet 11: Test deepEquals() method
contract TestMapDeepEquals {
    get fun test(): Int {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         m1.set(1, 10);
         m2.set(1, 10);
         // deepEquals should return true
         return m1.deepEquals(m2) ? 42 : 0; // Expected: 42
    }
}

// Snippet 12: Test equality operator (shallow equality) on maps
contract TestMapEquals {
    get fun test(): Int {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();
         m1.set(1, 10);
         m2.set(1, 10);
         // Using equality operator (==) which compares map hashes
         return m1 == m2 ? 1 : 0; // Expected: 1 if underlying serialization is consistent
    }
}

// Snippet 13: Test reassigning persistent map state variable
contract TestMapReassign {
    // Persistent state variable
    m: map<Int, Int>;

    // Initialization function
    init() {
         self.m = emptyMap();
         self.m.set(2, 200);
    }

    // Getter function to test reassignment
    get fun test(): Int {
         // Reassign to an empty map; should delete all previous entries
         self.m = emptyMap();
         let res1 = self.m.exists(2) ? 0 : 21; // Expected: 21 since key 2 is deleted

         // Now reassign m to null (maps are allowed to be null, equivalent to emptyMap())
         self.m = null;
         let res2 = self.m == null ? 21 : 0;  // Expected: 21

         return res1 + res2; // Expected overall: 42
    }
}
