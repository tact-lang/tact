contract TestBitwiseOperators {
    receive() {
        let a: Int = 14;
        let b: Int = 11;
        let and_result: Int = a & b; // bitwise AND
        let or_result:  Int = a | b; // bitwise OR
        let xor_result: Int = a ^ b; // bitwise XOR
    }
}
