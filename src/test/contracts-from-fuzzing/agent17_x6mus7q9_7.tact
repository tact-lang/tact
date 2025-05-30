contract TestAsComment {
    fun run() {
        // Test the extension function on String to convert it to a Cell with asComment()
        let cellValue = "Hello, Tact!".asComment();
        dump(cellValue);
    }
    receive() {
        self.run();
    }
}
