contract Test {
    receive() {
         // Case 5: Using codeOf on the current contract: myCode() should be equivalent to codeOf Test
         let c1: Cell = myCode();
         let c2: Cell = codeOf Test;
         let eq: Bool = c1 == c2; // should be true according to docs
    }
}
