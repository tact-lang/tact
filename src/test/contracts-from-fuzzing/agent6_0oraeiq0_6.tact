contract TestDelete {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        fizz.set(7, 123);
        fizz.set(42, 321);
        let result1: Bool = fizz.del(7);
        dump(result1); // expected: true
        let result2: Bool = fizz.del(7);
        dump(result2); // expected: false
        fizz.set(42, null);
        dump(fizz.exists(42)); // expected: false
    }
}
