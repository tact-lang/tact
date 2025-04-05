struct One { number: Int; }

contract TestStruct {
    fun test() {
        // Instantiate a struct and convert it to a cell and back
        let a: One = One{ number: 42 };
        let cellA: Cell = a.toCell();
        let b: One = One.fromCell(cellA);
        dump(b.number); // expected output: 42
    }

    receive() {
        self.test();
    }
}
