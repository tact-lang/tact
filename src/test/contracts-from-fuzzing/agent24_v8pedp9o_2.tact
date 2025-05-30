contract Test {
    receive() {
        let addition: Int = 1 + 2;      // addition
        let subtraction: Int = 4 - 3;     // subtraction
        let multiplication: Int = 3 * 10;   // multiplication
        let division: Int = 10 / 2;       // division
        dump(addition);
        dump(subtraction);
        dump(multiplication);
        dump(division);
        return;
    }
}
