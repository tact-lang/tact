/// Test Case: Valid usage of initOf and codeOf on a contract with parameters

contract Baz(x: Int) {
    receive() {}
}

contract Main2 {
    receive() {
         // Using initOf and codeOf on Baz, passing correct parameter set
         let pkg = initOf Baz(10);
         let c = codeOf Baz;
    }
}
