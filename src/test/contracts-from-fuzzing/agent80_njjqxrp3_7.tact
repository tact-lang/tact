contract ParamContract(param: Int) {
    // Contract with a parameter; implicit empty init exists since using contract parameters syntax
    receive() {}
}

contract TestParam {
    receive() {
         // Test using initOf with parameter for a contract with parameters
         let initCell = initOf ParamContract(42);
         let codeCell = codeOf ParamContract;
    }
}
