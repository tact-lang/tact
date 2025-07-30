fun test_escapes() {
    let s: String = "Backslash: \\ | Quote: \" | Newline: \n | Tab: \t | Hex: \xAB | Unicode: \u1234 | Unicode long: \u{1F602}";
    // Dump the string just to force compiler to utilize it
    dump(s);
}

contract Test {
    receive() {
        test_escapes();
    }
}
