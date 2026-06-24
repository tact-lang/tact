contract TestBitwiseExpressions() {
    fun run() {
        let a = 5;
        let not_a = ~a; // expected: -6
        require(not_a == -6, "Bitwise NOT error");
        let leftShift = a << 2; // expected: 20
        require(leftShift == 20, "Left shift error");
        let four = 4;
        let rightShift = four >> 2; // expected: 1
        require(rightShift == 1, "Right shift error");

        let and_val = a & four; // 5 (101) & 4 (100) = 4
        require(and_val == 4, "Bitwise AND error");
        let or_val = a | four; // 5 (101) | 4 (100) = 5
        require(or_val == 5, "Bitwise OR error");
        let xor_val = a ^ four; // 5 (101) ^ 4 (100) = 1
        require(xor_val == 1, "Bitwise XOR error");
    }
    
    receive() {
        self.run();
    }
}
