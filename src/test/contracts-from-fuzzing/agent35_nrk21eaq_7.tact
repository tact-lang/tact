struct BitResults {
    andVal: Int;
    orVal: Int;
    xorVal: Int;
    shlVal: Int;
    shrVal: Int;
}

contract BitTest {
    // Using a struct to return multiple values instead of tuple
    fun bitwiseOps(a: Int): BitResults {
       let andVal = a & 3;       // Bitwise AND with 3
       let orVal = a | 4;        // Bitwise OR with 4
       let xorVal = a ^ 2;       // Bitwise XOR with 2
       let shlVal = a << 1;      // Shift left by 1
       let shrVal = a >> 1;      // Shift right by 1
       return BitResults { andVal, orVal, xorVal, shlVal, shrVal };
    }
    
    receive() {
       // Force compilation by calling the function with a sample input
       self.bitwiseOps(8);
    }
}
