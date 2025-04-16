/// TestStructs: Validates that structs can be instantiated, converted to a cell and then reconstructed correctly.

// Define a minimal struct as in documentation
struct One { number: Int; }

contract TestStructs() {
    fun run() {
        // Instantiate struct with a value
        let s: One = One{ number: 42 };
        // Convert struct to cell
        let cell: Cell = s.toCell();
        // Reconstruct the struct from the cell
        let s2: One = One.fromCell(cell);
        // Dump the original and reconstructed values for comparison
        dump(s.number);    // expected 42
        dump(s2.number);   // expected 42
    }

    receive() {
        self.run();
        cashback(sender());
    }
}

// Dummy contract to prevent dead code elimination
contract DummyStructs() {}
