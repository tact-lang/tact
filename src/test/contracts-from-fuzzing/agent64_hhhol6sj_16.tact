fun testAllEscapes(): String {
    return "backslash: \\ double quote: \" newline: \n carriage: \r tab: \t vertical: \v backspace: \b formfeed: \f hex: \x20 uni4: \u0041 uni: \u{42}";
}

contract TestContract {
    receive() {
        let s = testAllEscapes();
    }
}
