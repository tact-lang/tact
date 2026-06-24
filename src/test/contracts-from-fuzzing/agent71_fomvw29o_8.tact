fun testEscapesValid(): String {
    return "Quote: \" , Backslash: \\ , Newline: \n, Tab: \t, Hex: \x41, Unicode: \u0042, Extended: \u{1F602}";
}

contract TestContract {
    receive() {
         let s = testEscapesValid();
    }
}
