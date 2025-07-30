contract TestMapDel {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 500);
        m.set(20, 600);
        // Delete key 10
        let res1: Bool = m.del(10);
        dump(res1); // expected: true
        // Delete key 10 again
        let res2: Bool = m.del(10);
        dump(res2); // expected: false
        // Check that key 10 is deleted
        if (m.get(10) == null) { dump(1); }
    }
}
