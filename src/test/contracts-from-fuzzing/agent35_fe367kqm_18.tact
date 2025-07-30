extends fun myToCoinsString(self: Int): String {
    // Return the float string representation with 9 decimal places
    return self.toFloatString(9);
}

fun runTest() {
    let s: String = 5.myToCoinsString();
    dump(s); // Expected: "0.000000005"
}
