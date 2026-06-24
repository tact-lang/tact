struct Complex {
    a: Int as int256;
    b: Int as int256;
    c: Int as int256;
    flag: Bool;
    d: Int as int256;
}

contract TestComplexConversion {
    receive() {
        // Instantiate the Complex struct
        let orig: Complex = Complex{ a: 1, b: 2, c: 3, flag: true, d: 4 };
        // Convert the struct to a Cell
        let cell = orig.toCell();
        // Parse it back from the Cell
        let parsed: Complex = Complex.fromCell(cell);
        // Use a field to ensure the conversion is fully processed
        parsed.flag;
    }
}
