contract Test {
    receive() {
        let hexEsc: String = "Hello \xFFsome more";
    }
}