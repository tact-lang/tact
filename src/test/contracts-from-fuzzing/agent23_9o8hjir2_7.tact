contract Test {
    receive() {
        let map1: map<Int, Int> = emptyMap();
        let map2: map<Int, Int> = emptyMap();

        map1.set(1, 2);
        map2.set(1, 2);
        
        // Shallow equality via '==' (may or may not be same as deepEquals) but deepEquals should be true
        dump(map1.deepEquals(map2)); // expected output: true
    }
}
