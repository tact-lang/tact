// Several fuzz-testing snippets have been compiled to validate the behavior of maps in Tact.
//
// Summary of tests performed:
//
// 1. Valid Map Operations:
//    - Using allowed key types (Int and Address) and allowed value types (Int, Bool, Cell, Struct, Message).
//    - Tested operations: set, get, replace, replaceGet, del, exists, deepEquals, iteration, and asCell().
//
// 2. Key Type Restrictions:
//    - Snippets using disallowed key types (e.g., Bool, String) failed compilation as expected (see error message and docs: https://docs.tact-lang.org/book/maps#allowed-types  ).
//    - Attempt to use a varint serialization on map keys also failed, confirming that keys must be of fixed-width types.
//
// 3. Nested Maps:
//    - A nested map scenario was successfully compiled using a struct wrapper (AllowanceMap) containing a map<Address, Int> within a map<Address, AllowanceMap> (see citeturn7file.md reference above).
//
// 4. Map Iteration and Serialization:
//    - Iterating over a persistent map and summing values worked as documented.
//    - Converting maps to cells with asCell() returns null for empty maps and a Cell for non-empty maps.
//
// All compiled snippets demonstrated that the Tact compiler behavior aligns with the official documentation regarding maps. 
// No discrepancies or compiler bugs were found during this comprehensive fuzz-testing cycle regarding maps.

// The following is a minimal contract to summarize these tests:

struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract ComprehensiveMapTest {
    // Test valid key and value operations
    get fun validKeyValueTest(): Int {
        let m: map<Int, Bool> = emptyMap();
        m.set(42, true);
        return m.get(42)!! ? 1 : 0;
    }

    // Test set-get for map<Int, Int>
    get fun setGetTest(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.get(7)!!;
    }

    // Test deletion via setting to null
    get fun deleteTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(7, null);
        return m.get(7) == null;
    }

    // Test replace
    get fun replaceTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replace(7, 68);
    }

    // Test replaceGet
    get fun replaceGetTest(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replaceGet(7, 68)!!;
    }

    // Test exists
    get fun existsTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.exists(7);
    }

    // Test deepEquals and shallow equality
    get fun deepEqualsTest(): Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(7, 70);
        m2.set(7, 70);
        return m1.deepEquals(m2) && (m1 == m2);
    }

    // Test nested maps
    get fun nestedMapTest(): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let allowance: AllowanceMap = AllowanceMap { unbox: emptyMap() };
        allowance.unbox.set(myAddress(), 42);
        allowances.set(myAddress(), allowance);
        return allowances.get(myAddress())!!.unbox.get(myAddress())!!;
    }

    // Persistent map for iteration test
    fizz: map<Int, Int>;

    init() {
        self.fizz = emptyMap();
        self.fizz.set(10, 100);
        self.fizz.set(20, 200);
    }

    // Test iteration
    get fun iterationTest(): Int {
        let sum: Int = 0;
        foreach (k, v in self.fizz) {
            sum = sum + v;
        }
        return sum;
    }

    // Test serialization with fixed-width for keys
    get fun serializationTest(): Int {
        let m: map<Int as uint8, Int> = emptyMap();
        m.set(5, 50);
        return m.get(5)!!;
    }
}

contract MapAsCellTest {
    // Test asCell on empty and non-empty maps
    get fun testEmptyAsCell(): Int {
        let m: map<Int, Int> = emptyMap();
        if (m.asCell() == null) {
            return 1;
        } else {
            return 0;
        }
    }

    get fun testNonEmptyAsCell(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        if (m.asCell() != null) {
            return 1;
        } else {
            return 0;
        }
    }
}

// Note: Negative tests using invalid key types (such as Bool or String) and invalid serialization annotations on map keys resulted in compilation errors as expected.
// For example, attempting to compile a map with key type Bool:
//   let m: map<Bool, Int> = emptyMap();
// produced an error stating "Invalid map type. Check https://docs.tact-lang.org/book/maps#allowed-types".

// Conclusion: All observed behaviors of maps conform to the official documentation (  and related sections). No discrepancies have been found between the documentation and the Tact compiler's behavior regarding maps.
