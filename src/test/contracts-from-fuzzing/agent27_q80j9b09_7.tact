contract D() {
    // Contract with an empty parameter list
    receive() {}
}

contract TestD {
    receive() {
         // Valid use: initOf for a contract using contract parameters syntax (empty list)
         let s = initOf D();
         // Valid use: codeOf for the same contract
         let c = codeOf D;
    }
}
