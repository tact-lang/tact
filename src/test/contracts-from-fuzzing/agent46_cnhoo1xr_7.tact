contract TestComplex {
    // constant expression for arithmetic evaluation
    const RESULT: Int = 1 + 2 * 3; // expected to be 7 at compile time

    get fun getResult(): Int {
         return self.RESULT;
    }
}
