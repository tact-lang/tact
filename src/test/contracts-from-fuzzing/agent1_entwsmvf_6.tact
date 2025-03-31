struct AllowanceMap {
    unbox: map<Address, Int>
}

contract TestMapFeatures {

    // Test 1: isEmpty and null check
    get fun testIsEmpty(): Int {
        let m: map<Int, Int> = emptyMap();
        // According to docs, a map created with emptyMap() compares equal to null and is empty.
        if (m.isEmpty() && (m == null)) { 
            return 1; 
        } else { 
            return 0; 
        }
    }

    // Test 2: Test deletion using .del() and .set(key, null)
    get fun testDel(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        let firstDel = m.del(1); // should be true
        let secondDel = m.del(1); // should be false, since already deleted
        // Now test deletion with set(key, null) syntax
        m.set(2, 100);
        m.set(2, null); // should delete key 2
        if (firstDel && (!secondDel) && (m.get(2) == null)) { 
            return 1; 
        } else { 
            return 0; 
        }
    }

    // Test 3: Test replace and replaceGet functionalities
    get fun testReplaceAndDelete(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(3, 100);
        // Replace existing key with non-null value
        let replaced = m.replace(3, 200); // should be true
        let valueAfterReplace = m.get(3)!!; // should now be 200
        // Replace with null to delete
        let replacedDelete = m.replace(3, null); // should be true
        if (replaced && (valueAfterReplace == 200) && replacedDelete && (m.get(3) == null)) { 
            return 1; 
        } else { 
            return 0; 
        }
    }

    // Test 4: Test deepEquals between two maps
    get fun testDeepEquals(): Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        m2.set(1, 10);
        m2.set(2, 20);
        if (m1.deepEquals(m2)) { 
            return 1; 
        } else { 
            return 0; 
        }
    }

    // Test 5: Test asCell conversion on maps
    get fun testAsCell(): Int {
        let m: map<Int, Int> = emptyMap();
        // For an empty map, asCell() should return null
        if (m.asCell() != null) { return 0; }
        m.set(1, 500);
        // For a non-empty map, asCell() should return a Cell, i.e. non-null
        if (m.asCell() == null) { return 0; }
        return 1;
    }

    // Test 6: Nested maps - using a struct that wraps a map
    get fun testNestedMaps(): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let inner: map<Address, Int> = emptyMap();
        inner.set(myAddress(), 123);
        let am: AllowanceMap = AllowanceMap{ unbox: inner };
        allowances.set(myAddress(), am);
        if (allowances.get(myAddress())!! .unbox.get(myAddress())!! == 123) { 
            return 1; 
        } else { 
            return 0; 
        }
    }

    // Test 7: Serialization: map with serialized key and value as uint8
    get fun testSerialization(): Int {
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        m.set(255, 128);
        let v: Int? = m.get(255);
        if (v == null) { 
            return 0; 
        } else { 
            return v!!; 
        }
    }
}
