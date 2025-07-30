contract PowConstantTest {
    const VAL: Int = pow2(4); // Expected to be 16

    receive() {
        let a: Int = self.VAL;
    }
}
