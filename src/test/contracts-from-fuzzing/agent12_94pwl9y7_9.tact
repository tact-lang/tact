struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract ComprehensiveMapTest {
    // Test valid operations on maps (using allowed key and value types as per documentation)

    // 1. Valid key and value types test
    get fun validKeyValueTest(): Int {
        let m: map<Int, Bool> = emptyMap();
        m.set(42, true);
        return m.get(42)!! ? 1 : 0;
    }

    // 2. Test set and get on map<Int, Int>
    get fun setGetTest(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.get(7)!!;
    }

    // 3. Test deletion by setting null
    get fun deleteTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(7, null);
        return m.get(7) == null;
    }

    // 4. Test replace method
    get fun replaceTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replace(7, 68);
    }

    // 5. Test replaceGet method
    get fun replaceGetTest(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replaceGet(7, 68)!!;
    }

    // 6. Test exists method
    get fun existsTest(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.exists(7);
    }

    // 7. Test deepEquals for shallow and deep equality (should return true)
    get fun deepEqualsTest(): Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(7, 70);
        m2.set(7, 70);
        return m1.deepEquals(m2) && (m1 == m2);
    }

    // 8. Nested maps test: using struct wrappers
    get fun nestedMapTest(): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let allowance: AllowanceMap = AllowanceMap { unbox: emptyMap() };
        allowance.unbox.set(myAddress(), 42);
        allowances.set(myAddress(), allowance);
        return allowances.get(myAddress())!!.unbox.get(myAddress())!!;
    }

    // 9. Test iteration over map entries
    fizz: map<Int, Int>; // persistent variable

    init() {
        self.fizz = emptyMap();
        self.fizz.set(10, 100);
        self.fizz.set(20, 200);
    }

    get fun iterationTest(): Int {
        let sum: Int = 0;
        foreach (k, v in self.fizz) {
            sum = sum + v;
        }
        return sum;
    }

    // 10. Test serialization: valid fixed-width serialization on map key
    get fun serializationTest(): Int {
        // Valid, as keys are Int serialized as uint8 (fixed width)
        let m: map<Int as uint8, Int> = emptyMap();
        m.set(5, 50);
        return m.get(5)!!;
    }
}
