contract Test {
    const A: Int = 10;
    const B: Int = self.A + 5;

    get fun value(): Int {
        return self.B;
    }
}
