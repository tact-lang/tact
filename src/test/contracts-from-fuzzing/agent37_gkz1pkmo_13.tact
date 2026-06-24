contract TestTernaryPrecedence {
    receive() {
         // Right associativity in nested ternary operator
         // false ? 1 : true ? 2 : 3  => evaluates as false ? 1 : (true ? 2 : 3) => 2
         let a: Int = false ? 1 : true ? 2 : 3;
         // With explicit parentheses in condition part
         let b: Int = false ? (false ? 1 : 2) : 3; // evaluates to 3
         let c: Int = true ? 1 : 2; // evaluates to 1
    }
}
