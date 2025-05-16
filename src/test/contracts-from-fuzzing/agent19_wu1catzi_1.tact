contract Test {
    receive() {}
    
    // Test a simple arithmetic operation that should compile correctly.
    get fun additionTest(): Int {
         return 1 + 2;
    }

    // Test a boundary arithmetic operation involving subtraction.
    get fun subtractionTest(): Int {
         return 0 - 1;
    }

    // Test a multiplication operation.
    get fun multiplicationTest(): Int {
         return 3 * 4;
    }

    // Test a division operation.
    get fun divisionTest(): Int {
         return 8 / 2;
    }
}
