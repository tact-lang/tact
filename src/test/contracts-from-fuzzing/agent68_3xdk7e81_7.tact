contract Test2 {
    const A: Int = 10;
    const B: Int = 32;
    const C: Int = self.A + self.B; // expected 42
    a: Int = self.C;

    receive() {}
}
