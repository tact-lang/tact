contract TestContract {
    receive() {
        // Testing a string with a variety of escape sequences
        let s: String = "Complex: \\ \" \n \r \t \v \b \f \x41 \u0042 \u{1F642}";
        s;
    }
}
