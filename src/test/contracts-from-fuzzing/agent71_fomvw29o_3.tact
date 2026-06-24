fun testEscapes(): String {
    // Testing various escape sequences:
    // \\ -> Backslash
    // \" -> Double quote
    // \n -> Newline
    // \r -> Carriage return
    // \t -> Tab
    // \v -> Vertical tab
    // \b -> Backspace
    // \f -> Form feed
    return "Backslash: \\ \nDouble quote: \"quoted\" \nNewline: \n\rCarriageReturn \nTab:\tEnd \nVerticalTab:\vTest \nBackspace: Test\bXD \nFormFeed:\fDone";
}

contract TestContract {
    receive() {
         let s = testEscapes();
    }
}
