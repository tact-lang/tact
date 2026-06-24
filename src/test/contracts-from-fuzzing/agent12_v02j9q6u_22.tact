contract TestMapEquality {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        let buzz: map<Int, Int> = emptyMap();
        
        // Insert entries in different orders
        fizz.set(10, 100);
        fizz.set(20, 200);

        buzz.set(20, 200);
        buzz.set(10, 100);

        // Check equality using both shallow and deep equality
        dump(fizz == buzz);         // Expected: true
        dump(fizz.deepEquals(buzz));  // Expected: true
    }
}
