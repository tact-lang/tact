contract TestMapReplace {
    m: map<Int, Int> = emptyMap();

    receive() {
        self.m.set(1, 400);
        // Attempt to replace key 1's value
        let replaced = self.m.replace(1, 500);
    }
}
