contract TestMapDel {
    receive() {
        let m: map<Int, Int> = emptyMap();
        // Insert key 5 with value 55
        m.set(5, 55);
        // Delete existent key 5
        let res1: Bool = m.del(5);
        dump(res1); // Expected output: true
        // Attempt to delete key 5 again (should not exist)
        let res2: Bool = m.del(5);
        dump(res2); // Expected output: false
    }
}
