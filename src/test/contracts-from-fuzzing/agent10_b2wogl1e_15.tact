contract TestStringAsComment() {
    fun run() {
        // Test the asComment() extension on string literals
        let cellComment = "test comment".asComment();
        // Check that the resulting cell is not empty
        require(cellComment != emptyCell(), "asComment returned an empty cell");
    }

    receive() {
        self.run();
    }
}
