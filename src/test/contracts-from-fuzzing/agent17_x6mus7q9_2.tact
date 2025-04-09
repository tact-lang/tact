contract TestArithmetic {
    fun run() {
       // Expected result: 9
       let result: Int = 5 + 4 - 5 * 4 / 5 % 4;
       // Dump the computed result
       dump(result);
    }
    receive() {
       self.run();
    }
}
