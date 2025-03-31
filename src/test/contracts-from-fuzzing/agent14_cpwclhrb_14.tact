contract TestMapForeach {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // Insert key-value pairs in non-sorted order
        self.dict.set(5, 500);
        self.dict.set(2, 200);
        self.dict.set(9, 900);
        self.dict.set(1, 100);
        
        // Iterate over map using foreach and compute a sum to verify order
        let total: Int = 0;
        foreach (k, v in self.dict) {
            dump(k);
            dump(v);
            total += k + v;
        }
        dump(total);
    }
}
