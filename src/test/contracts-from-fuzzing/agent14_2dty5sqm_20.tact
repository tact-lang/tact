contract TestMapReassign {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(1, 10);
        // Reassign map by setting to emptyMap (all entries erased)
        self.m = emptyMap();
        // Reassign map to null (equivalent to emptyMap)
        self.m = null;
    }

    // Getter verifying that map is empty and equal to null
    get fun testReassign(): Bool {
        return self.m.isEmpty() && (self.m == null);
    }
}
