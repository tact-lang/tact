contract TestAssignmentOperators {
    receive() {
        let a: Int = 10;
        a += 5;   // now a becomes 15
        a -= 3;   // now a becomes 12
        a *= 2;   // now a becomes 24
        a /= 2;   // now a becomes 12
        a;        // should evaluate to 12
    }
}
