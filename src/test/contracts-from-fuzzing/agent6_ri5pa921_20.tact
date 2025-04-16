contract FuzzMapsAdvanced {

    // Test: Using exists() with a computed key expression
    get fun testExists() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set((2 + 2) * (3 - 1), 999); // key = 8
        let existsLogic = m.exists(8) ? 100 : 0;
        return existsLogic; // expected 100 if key 8 exists
    }

    // Test: deepEquals and shallow equality on maps created in different orders
    get fun testDeepEquals() : Int {
        let m1: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        m1.set(3, 30);

        let m2: map<Int, Int> = emptyMap();
        m2.set(3, 30);
        m2.set(1, 10);
        m2.set(2, 20);

        let deepResult = m1.deepEquals(m2) ? 1 : 0;
        let shallowResult = (m1 == m2) ? 2 : 0;
        return deepResult + shallowResult; // expected 3 if both comparisons are true
    }

    // Test: Iteration over an empty map and after deletion
    get fun testEmptyIteration() : Int {
        let m: map<Int, Int> = emptyMap();
        let cnt = 0;
        foreach (k, v in m) {
            cnt = cnt + 1;
        }
        m.set(5, 50);
        m.del(5);
        foreach (k, v in m) {
            cnt = cnt + 1;
        }
        return cnt; // expected 0
    }

    // Test: Replacing a value for a non-existing key should return false
    get fun testReplaceNonExist() : Int {
        let m: map<Int, Int> = emptyMap();
        let rep = m.replace(42, 42); // key 42 does not exist
        return rep ? 1 : 0; // expected 0
    }

    // State: A map stored in contract state
    m_state: map<Int, Int>;

    init() {
         self.m_state = emptyMap();
         self.m_state.set(10, 100);
         self.m_state.set(20, 200);
         self.m_state.set(30, 300);
    }

    // Test: Iteration over a state variable map
    get fun testStateIteration() : Int {
         let s = 0;
         foreach (k, v in self.m_state) {
             s = s + v;
         }
         return s; // expected 600
    }

    // Test: asCell() conversion behavior on empty and non-empty maps
    get fun testAsCell() : Int {
         let m: map<Int, Int> = emptyMap();
         let cellEmpty = m.asCell();
         m.set(7, 77);
         let cellNonEmpty = m.asCell();
         // Return 1 if cellEmpty is null whereas cellNonEmpty is not null
         let result = ((cellEmpty == null) && (cellNonEmpty != null)) ? 1 : 0;
         return result; // expected 1
    }

    // Test: Using replaceGet on a non-existent key should return null
    get fun testReplaceGetNonExist() : Int {
         let m: map<Int, Int> = emptyMap();
         let old = m.replaceGet(100, 200);
         return (old == null) ? 1 : 0;  // expected 1
    }

    // Test: Delete entry via replace with null; should return true and then key no longer exists
    get fun testDeleteViaReplace() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(55, 555);
         let rep = m.replace(55, null);
         let existsAfter = m.exists(55);
         return (rep && !existsAfter) ? 1 : 0;  // expected 1
    }

    // Test: Serialization test for map with key annotation (only key can be serialized compactly)
    get fun testSerialization() : Int {
         let m: map<Int as uint32, Int> = emptyMap();
         m.set(100, 1000);
         let res = m.get(100)!!;
         return res; // expected 1000
    }

}
