/* Case 1: Valid usage of codeOf with a simple contract */

contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
         let c = codeOf A;  // should compile correctly
    }
}
