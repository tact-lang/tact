contract TestBinaryOperators {
    receive() {
        // Multiplication
        dump(6 * 7);         // expected output: 42

        // Division (integer division)
        dump(10 / 3);        // expected output: 3 (truncated integer division)

        // Modulo operator
        dump(10 % 3);        // expected output: 1

        // Bitwise operators
        dump(6 & 3);         // bitwise AND: 6 (110) & 3 (011) = 2 (010)
        dump(2 ^ 3);         // bitwise XOR: 2 (010) ^ 3 (011) = 1 (001)
        dump(2 | 3);         // bitwise OR: 2 (010) | 3 (011) = 3 (011)
    }
}
