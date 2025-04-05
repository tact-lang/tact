contract TestDivision {
    receive() {
        // Testing valid division expressions
        let d1: Int = 10 / 2; // Expected 5
        let d2: Int = 7 / 3;  // Expected 2 (integer division truncates towards zero)
        let d3: Int = -7 / 3; // Expected -2 or -3? Let's check docs; docs say truncs towards zero if positive and away from zero if negative. 
                              // Actually, documentation says: "truncates toward zero if the result is positive and away from zero if the result is negative." So -7 / 3 should be -3.

        dump(d1);
        dump(d2);
        dump(d3);
    }
}
