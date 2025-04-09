contract TestAsComment {
    receive() {
        // Test conversion of a string to a Cell via asComment()
        let commentCell: Cell = "Hello Tact!".asComment();
        // Use the cell's hash in a dummy arithmetic operation
        let dummy: Int = commentCell.hash() % 1000;
    }
}
