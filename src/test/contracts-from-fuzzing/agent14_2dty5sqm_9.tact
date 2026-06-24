struct TestDelResult {
    exists: Bool;
    value: Int?;
}

contract TestMapDelete {
    m: map<Int, Int> = emptyMap();

    init() {
        // Set entry and delete it
        self.m.set(5, 50);
        let _ = self.m.del(5);  // should return true
        let _ = self.m.del(5);  // deletion again should return false
        
        // Set another entry and then delete via setting null
        self.m.set(6, 60);
        self.m.set(6, null);   // equivalent to deleting key 6
    }

    // Getter: check existence of key 5 (should be false) and key 6 (should be deleted, so value null)
    get fun testDel() : TestDelResult {
        return TestDelResult{ exists: self.m.exists(5), value: self.m.get(6) };
    }
}
