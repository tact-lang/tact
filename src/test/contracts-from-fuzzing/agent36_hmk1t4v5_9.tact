contract Test {
    receive() {
        { dump(1) } // Block with only one statement, semicolon omitted
    }
}