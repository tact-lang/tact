contract TestBitwise {
    fun test() {
        let five = 5;
        // Testing arithmetic and bitwise operators
        dump(-five);           // Expected: -5
        dump(~five);           // Expected: -6
        dump(-( ~five));       // Expected: 6
        dump(~(-five));        // Expected: 4

        dump(five << 2);       // Expected: 20
        dump(4 >> 2);          // Expected: 1
        dump(-4 >> 2);         // Expected: -1 (arithmetic shift)

        dump(five & 4);        // Expected: 4
        dump(five | 4);        // Expected: 5
        dump(five ^ 4);        // Expected: 1
    }

    receive() {
         self.test();
    }
}
