contract Test {
    receive() {
        let s: String = "escape \\ and \" and \n and \r and \t and \v and \b and \f and \x22";
    }
}
