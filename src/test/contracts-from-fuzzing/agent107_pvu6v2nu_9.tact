contract J(param: Int) {
    // Contract J uses contract parameters syntax implicitly
}

contract K {
    receive() {
         // Using codeOf on a contract with parameters works without providing arguments
         let j_code = codeOf J;
         // For testing, compare with self's myCode (if K was same as J, they differ though)
         // Just checking that codeOf expression compiles and returns a Cell
    }
}
