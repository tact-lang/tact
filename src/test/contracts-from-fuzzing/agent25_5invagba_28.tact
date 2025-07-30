contract TestMathChain2 {
    receive() {
        // Test shifting applied to the result of an arithmetic expression
        let x: Int = (1 + 2) << 3; // (1+2)=3, then << 3 equals 3*2^3 = 24
        dump(x);
    }
}
