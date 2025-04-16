struct NestedMap {
    inner: map<Int, Int>;
}

contract MapFuzzSummary {
    get fun test(): Int {
        // Test deepEquals by creating two identical maps
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let m2: map<Int, Int> = emptyMap();
        m2.set(1, 100);
        if (!m.deepEquals(m2)) { return 1; }

        // Test serialization with fixed-width annotations
        let m3: map<Int as uint8, Int as uint8> = emptyMap();
        m3.set(5, 250);
        if (m3.get(5)!! != 250) { return 2; }

        // Test nested maps using externally defined struct
        let nm: NestedMap = NestedMap{ inner: emptyMap() };
        nm.inner.set(7, 777);
        let m4: map<Address, NestedMap> = emptyMap();
        m4.set(myAddress(), nm);
        if (m4.get(myAddress())!!.inner.get(7)!! != 777) { return 3; }

        // Test replace and replaceGet
        let m5: map<Int, Int> = emptyMap();
        m5.set(2, 200);
        if (!m5.replace(2, 300)) { return 4; }
        if (m5.get(2)!! != 300) { return 5; }
        let old: Int? = m5.replaceGet(2, 400);
        if (old == null || old != 300) { return 6; }
        if (m5.get(2)!! != 400) { return 7; }

        // Test deletion
        let m6: map<Int, Int> = emptyMap();
        m6.set(10, 1000);
        if (!m6.del(10)) { return 8; }
        if (m6.exists(10)) { return 9; }

        return 0;
    }
}
