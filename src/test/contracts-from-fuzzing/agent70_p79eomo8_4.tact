struct One { number: Int; }

contract TestStructConversions {
    receive() {
        // Instantiate a struct and convert it to a Cell and back
        let one: One = One{ number: 50 };
        let cell = one.toCell();
        let one2 = One.fromCell(cell);
        dump(one2.number); // expected output: 50
    }
}
