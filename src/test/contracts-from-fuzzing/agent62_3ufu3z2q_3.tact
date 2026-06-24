contract Test {
    receive() {
        // Testing various valid escape sequences in a string literal
        let s: String = "Escape sequences: \\ \" \n \r \t \v \b \f \x22 \u0041 \u{1F602}";
    }
}
