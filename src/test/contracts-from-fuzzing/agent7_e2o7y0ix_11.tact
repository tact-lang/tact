/*
  Fuzz Test: Bitwise Operators in Tact
  This snippet rigorously tests bitwise operator behavior on Int values. It includes:
  - Bitwise AND (&), OR (|), and XOR (^) operations
  - Testing with literal binary values, decimal values, and negative numbers
  - Combined operations

  The expected results are derived from standard bitwise behavior:
  - For example: 0b11111111 & 0b00001111 == 0b00001111 (15 in decimal)
  - 0b11111111 | 0b00001111 == 0b11111111 (255 in decimal)
  - 0b11111111 ^ 0b00001111 == 0b11110000 (240 in decimal)
  - Using -1 (all ones in two's complement representation) in Tact should yield similar bit-level results.

  Note: Tact integers are 257-bit signed; however, for these tests we consider behavior on lower bits.
*/

fun testBitwiseOperators() {
    // Define values in binary and decimal forms
    let a: Int = 0b11111111; // 255 in decimal
    let b: Int = 0b00001111; // 15 in decimal

    // Bitwise AND
    dump(a & b); // Expected: 15

    // Bitwise OR
    dump(a | b); // Expected: 255

    // Bitwise XOR
    dump(a ^ b); // Expected: 240

    // Test with a negative number
    let negative: Int = -1;  // In two's complement, -1 is all ones
    dump(negative & b); // Expected: 15, as all bits are ones resulting in b

    // Combined operations
    dump((a & b) | (a ^ b)); // Expected: (15 | 240) = 255

    // Additional test: Toggle bits using XOR
    // If we toggle b from a, we should get (a ^ b) back
    dump(a ^ b); // Expected: 240
}

fun main() {
    testBitwiseOperators();
    return;
}
