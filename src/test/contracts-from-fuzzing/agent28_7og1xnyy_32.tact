contract TestEscapedQuotes {
    receive() {
        // Testing that escaped double quotes are handled correctly
        "this \"literally\" works";
    }
}
