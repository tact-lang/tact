contract TestInvalidTernary {
    receive() {
         // This should trigger a syntax error. According to docs, lacking parentheses in consequence case is invalid.
         let a: Int = false ? 1 : false ? 1 : 2;
    }
}
