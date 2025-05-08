contract TestMapForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert key-value pairs in non-sorted order
        self.m.set(30, 300);
        self.m.set(10, 100);
        self.m.set(20, 200);

        // Iterate over the map using a foreach loop; keys should be output in increasing order
        foreach (key, value in self.m) {
            dump(key);
        }
    }
}
