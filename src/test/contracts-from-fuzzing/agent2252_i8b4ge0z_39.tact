contract OnlyMaps {
    // Should be rejected due to map ban
    m: map<Int, Int>;
    init() {
        self.m = emptyMap();
    }
}