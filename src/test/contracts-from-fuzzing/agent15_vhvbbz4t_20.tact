contract TestMapForeachDiscardKey {
    m: map<Int, Int> = emptyMap();

    receive() {
         self.m.set(1, 111);
         self.m.set(2, 222);
         // Iterate over the map, discarding keys and using only values.
         foreach (_, v in self.m) {
             // For each value, store a new entry with key = value + 1000 and the same value
             self.m.set(v + 1000, v);
         }
    }
}
