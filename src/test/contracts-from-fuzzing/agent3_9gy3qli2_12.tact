struct Divs {
    d1: Int;
    d2: Int;
    d3: Int;
}

fun testDivisions(): Divs {
    return Divs{
        d1: 3 / 2,    // Expected: 1
        d2: -3 / 2,   // Expected: -2
        d3: 2 / -3    // Expected: -1, since 2/(-3) ≃ -0.666, floors to -1
    };
}

contract DivTest {
    get fun results(): Divs {
        return testDivisions();
    }
    receive() {
        cashback(sender());
    }
}
