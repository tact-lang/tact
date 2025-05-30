contract TestExists {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        fizz.set(1, 100);
        // exists should return true for key 1, false otherwise
        let exists1: Bool = fizz.exists(1);
        let exists2: Bool = fizz.exists(2);
        dump(exists1); // expected: true
        dump(exists2); // expected: false
    }
}
