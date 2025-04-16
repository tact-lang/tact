contract CalcTest {
    const CALC: Int = 10 + 32;

    receive() {
        let a: Int = self.CALC;
    }
}
