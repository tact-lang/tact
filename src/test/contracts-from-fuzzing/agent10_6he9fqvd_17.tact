struct Complex {
    a: Int;
    b: Int?;
}

contract TestStructConversion {
    receive() {
        let comp = Complex { a: 42, b: 100 };
        let cell = comp.toCell();
        let comp2: Complex = Complex.fromCell(cell);
        let sum = comp2.a + (comp2.b == null ? 0 : comp2.b!!);
    }
}
