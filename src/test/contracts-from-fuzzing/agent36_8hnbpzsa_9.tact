contract TestDeepEquals {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        let buzz: map<Int, Int> = emptyMap();
        fizz.set(1, 2);
        buzz.set(1, 2);
        // Compare using deepEquals; should be true
        if (fizz.deepEquals(buzz)) {
            dump(1);  // expected output: 1
        } else {
            dump(0);
        }
    }
}
