struct One { number: Int; }

contract TestStruct() {
    fun run() {
        let s: One = One { number: 50 };
        dump(s.number); // expected output: 50
        let cellRep: Cell = s.toCell();
        let s2: One = One.fromCell(cellRep);
        dump(s2.number); // expected output: 50
    }

    receive() {
        self.run();
    }
}
