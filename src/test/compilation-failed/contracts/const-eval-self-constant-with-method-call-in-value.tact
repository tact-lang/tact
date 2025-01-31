contract Test {
    a: Int = 1;

    const B: Int = 10;
    const A: Int = self.B + self.test();

    fun test(): Int {
        return self.a;
    }
}
