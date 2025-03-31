struct AllowanceMap { unbox: map<Address, Int>; }

contract ComprehensiveMapTest {
    // Test 1: Valid map with key Int and value Int
    get fun testValidMap() : Int {
       let m: map<Int, Int> = emptyMap();
       m.set(1, 42);
       return m.get(1)!!; // Should return 42
    }

    // Test 2: Replacement and deletion operations
    get fun testReplaceDel() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(5, 10);
         let old = m.replaceGet(5, 20)!!; // returns 10, replaces with 20
         let res = m.get(5)!!; // now 20
         let delSuccess = m.del(5); // deletion should succeed
         if (old != 10 || res != 20 || !delSuccess || m.get(5) != null) { 
             return 1; 
         } 
         return 42;
    }

    // Test 3: Nested maps
    get fun testNestedMaps(): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let allowance = AllowanceMap{ unbox: emptyMap() };
        allowance.unbox.set(myAddress(), 99);
        allowances.set(myAddress(), allowance);
        return allowances.get(myAddress())!!.unbox.get(myAddress())!!; // Should return 99
    }

    // Test 4: Serialization of map with asCell() extension
    get fun testAsCell(): Int {
       let m: map<Int, Int> = emptyMap();
       if (m.asCell() != null) { return 1; } // empty map returns null
       m.set(2, 20);
       if (m.asCell() == null) { return 2; } // non-empty map returns non-null
       return 42;
    }

    // Test 5: Shallow vs deep equality, order independence
    get fun testEquality() : Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m1.set(2, 200);
        m2.set(2, 200);
        m2.set(1, 100);
        if (!m1.deepEquals(m2)) { return 1; }
        if (!(m1 == m2)) { return 2; }
        return 42;
    }

    // Test 6: Map with serialization format (uint8 for keys and values)
    get fun testSerialize() : Int {
       let m: map<Int as uint8, Int as uint8> = emptyMap();
       m.set(5, 10);
       return m.get(5)!!; // Expect 10
    }

    // Test 7: Overflow handling in serialization (values outside 0-255 get truncated)
    get fun testSerializeOverflow() : Int {
       let m: map<Int as uint8, Int as uint8> = emptyMap();
       m.set(300, 300);
       // 300 mod 256 = 44, so key 44 should store 44
       return m.get(44)!!;
    }

    // Aggregator to run all tests
    get fun runTests() : Int {
       if (self.testValidMap() != 42) { return 1; }
       if (self.testReplaceDel() != 42) { return 2; }
       if (self.testNestedMaps() != 99) { return 3; }
       if (self.testAsCell() != 42) { return 4; }
       if (self.testEquality() != 42) { return 5; }
       if (self.testSerialize() != 10) { return 6; }
       if (self.testSerializeOverflow() != 44) { return 7; }
       return 42;
    }
}
