contract TestComplexConstant {
    // Combining two compile-time functions: ascii and ton
    const CMP: Int = ascii("abc") + ton("0.000000001");
    // ascii("abc") should be 6382179 and ton("0.000000001") is 1
    receive() {
        require(self.CMP == 6382179 + 1, "Complex constant evaluation failed");
    }
}
