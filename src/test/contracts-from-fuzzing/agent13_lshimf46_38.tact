struct Dummy { n: Int }

contract TestCellConversion {
    receive() {
        // Test conversion of a struct to a Cell and back using fromSlice
        let d: Dummy = Dummy { n: 123 };
        let c: Cell = d.toCell();
        let s: Slice = c.asSlice();
        let d2: Dummy = Dummy.fromSlice(s);
        dump(d2.n); // Expected output: 123
    }
}
