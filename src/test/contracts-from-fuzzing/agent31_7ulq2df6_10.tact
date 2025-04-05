extends fun cellSize(self: Cell): Int {
    // Convert the cell to a slice and return the number of bits in it
    return self.asSlice().bits();
}

contract TestCell {
    // Receiver to test the extension function on Cell
    receive() {
         let size = emptyCell().cellSize();
         // For an empty cell, we expect 0 bits
         dump(size); // expected output: 0
         cashback(sender());
    }
    
    // Getter function to retrieve the cell size of an empty cell
    get fun getSize(): Int {
         return emptyCell().cellSize();
    }
}

fun main() {}
