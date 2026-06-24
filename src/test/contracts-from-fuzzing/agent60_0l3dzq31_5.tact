struct One { number: Int; }

contract StructTest {
    fun test() {
         let a: One = One{ number: 999 };
         let cellA: Cell = a.toCell();
         let b: One = One.fromCell(cellA);
         require(b.number == 999, "Struct serialization failed");
    }

    receive() {
         self.test();
    }
}
