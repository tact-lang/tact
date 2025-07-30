contract TestModulo() {
    fun test() {
        // Testing modulo operator with negative divisor: expected to produce -4 as per documentation
        let value = 1 % -5;
        dump(value);
    }
    
    receive() {
        self.test();
    }
}
