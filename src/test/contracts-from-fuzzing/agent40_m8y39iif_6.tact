contract Test {
    receive() {
        // Testing deepEquals() method on two identical maps
        let a: map<Int, Int> = emptyMap();
        let b: map<Int, Int> = emptyMap();
        a.set(1, 2);
        b.set(1, 2);
        if(a.deepEquals(b)) {
            dump(1); // Expected to dump 1
        } else {
            dump(0);
        }
    }
}
