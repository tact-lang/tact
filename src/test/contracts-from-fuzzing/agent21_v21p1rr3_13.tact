struct Simple {
    a: Int;
    b: Int;
}

contract TestCellConversion {
    // This contract tests converting a structure to a Cell and back using extension functions
    receive() {
        let s: Simple = Simple { a: 123, b: 456 };
        let cell: Cell = s.toCell();
        let parsed: Simple = Simple.fromCell(cell);
        dump(parsed.a + parsed.b); // Expect to dump 579
        return;
    }
}
