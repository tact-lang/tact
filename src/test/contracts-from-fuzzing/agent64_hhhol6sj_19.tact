fun testMixedEscapes(): String {
    return "Line: \n, Tab: \t, Quote: \" End with hex: \x41 and Unicode: \u0042 and extended Unicode: \u{43}.";
}

contract TestContract {
    receive() {
        let s = testMixedEscapes();
    }
}
