contract TestMapUnderscoreDiscard {
    receive() {
        // Testing foreach loop with discarding the key
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);
        
        // Sum values using underscore to discard key
        let total: Int = 0;
        foreach (_, v in m) {
            total = total + v;
        }
        
        dump(total); // Expected output: 60
    }
}
