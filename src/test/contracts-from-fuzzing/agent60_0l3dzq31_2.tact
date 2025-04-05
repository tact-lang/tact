contract PrimitiveIntTest {
    fun test() {
        let x: Int = 100;
        let y: Int = 200;
        let sum: Int = x + y;
        require(sum == 300, "Int addition failed");
    }

    receive() {
        self.test();
    }
}
