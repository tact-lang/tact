/// TestStructValid: Testing struct creation, conversion to and from Cell
struct One { number: Int; }

contract TestStructValid() {
    fun run() {
        let st: One = One{ number: 50 };
        let cell: Cell = st.toCell();
        let st2: One = One.fromCell(cell);
        dump(st2.number); // Expected output: 50
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
