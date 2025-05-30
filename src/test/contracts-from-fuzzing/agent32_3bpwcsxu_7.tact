contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set key 10 to value 100
        self.m.set(10, 100);
        
        // Use replaceGet to replace value at existing key 10 with 200
        let old1: Int? = self.m.replaceGet(10, 200);
        dump(old1!!); // Expected output: 100
        
        // Use replaceGet on a non-existing key 20; should return null
        let old2: Int? = self.m.replaceGet(20, 300);
        if (old2 == null) {
            dump(0); // Expected output: 0
        } else {
            dump(1);
        }
    }
}
