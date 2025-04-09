contract TestMapForeachOrder {
    receive() {
        // Testing foreach loop iteration order for map<Int, Int>
        // The expected iteration order is ascending order of keys
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        m.set(1, 200);
        m.set(5, 300);
        
        // Dump each key so we can inspect iteration order externally
        foreach (k, _ in m) {
            dump(k);
        }
    }
}
