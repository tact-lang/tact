struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract FuzzMaps {
    // Test with Int as key and Int as value
    fun testIntMap() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        return m.get(1)!!;
    }

    // Test replace and delete using replaceGet and del
    fun testReplaceDelete() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(2, 200);
        let oldVal: Int? = m.replaceGet(2, 250);
        let repScore: Int = oldVal == 200 ? 1 : 0;
        m.set(3, 300);
        let delSuccess: Bool = m.del(3);
        let delScore: Int = delSuccess ? 1 : 0;
        return repScore + delScore; // expect 2 if both succeed
    }

    // Test iterating over a map by checking values
    fun testIteration() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        foreach (k, v in m) {
            if (v != 10 && v != 20) {
                return 0;
            }
        }
        return 30; // if iteration works correctly
    }

    // Test isEmpty and exists
    fun testEmptyExists() : Int {
        let m: map<Int, Int> = emptyMap();
        let part1: Int = m.isEmpty() ? 10 : 0;
        m.set(5, 50);
        let part2: Int = m.exists(5) ? 5 : 0;
        if (m == null) {
            return 0;
        }
        return part1 + part2; // expected 15
    }

    // Test deepEquals and shallow equality
    fun testMapEquality() : Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(7, 70);
        m2.set(7, 70);
        let deepScore: Int = m1.deepEquals(m2) ? 10 : 0;
        let shallowScore: Int = (m1 == m2) ? 5 : 0;
        return deepScore + shallowScore; // expected 15
    }

    // Test nested maps using a wrapper struct
    fun testNestedMaps() : Int {
        let outer: map<Address, AllowanceMap> = emptyMap();
        let inner: map<Address, Int> = emptyMap();
        inner.set(myAddress(), 42);
        let am: AllowanceMap = AllowanceMap{ unbox: inner };
        outer.set(myAddress(), am);
        return outer.get(myAddress())!!.unbox.get(myAddress())!!;
    }

    // Test replace with null to delete an entry
    fun testReplaceDeleteNull() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(11, 110);
        let didReplace: Bool = m.replace(11, null);
        return didReplace ? 1 : 0;
    }

    // Aggregator: run all tests and sum their results
    fun runAll() : Int {
        return self.testIntMap() + self.testReplaceDelete() + self.testIteration() + self.testEmptyExists() + self.testMapEquality() + self.testNestedMaps() + self.testReplaceDeleteNull();
    }
}
