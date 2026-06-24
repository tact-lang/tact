contract TestMapExists {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Check existence of a non-set key
        let exists = self.m.exists(1);
    }
}
