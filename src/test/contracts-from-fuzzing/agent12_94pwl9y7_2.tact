contract MapOps {
    // Test set and get
    get fun testSetGet(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.get(7)!!;
    }

    // Test deletion using setting null
    get fun testDeleteUsingSet(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(7, null);
        let val: Int? = m.get(7);
        if (val == null) { return 1; } else { return 0; }
    }

    // Test replace method
    get fun testReplace(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replace(7, 68);
    }

    // Test replaceGet method
    get fun testReplaceGet(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.replaceGet(7, 68)!!;
    }

    // Test exists method
    get fun testExists(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        return m.exists(7);
    }

    // Test deepEquals method
    get fun testDeepEquals(): Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(7, 70);
        m2.set(7, 70);
        return m1.deepEquals(m2);
    }
}
