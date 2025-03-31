contract MapMutationDuringForeachTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert several entries
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
        
        // In the foreach loop, try to delete the current key
        foreach (k, v in self.m) {
            // Attempt to delete the key during iteration
            self.m.del(k);
        }

        // After mutation during iteration, dump whether map is empty
        dump(self.m.isEmpty());
    }
}
