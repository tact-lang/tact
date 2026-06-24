contract TestParams(param: Int) {
    receive() {}
}

contract ContainerParams {
    receive() {
         // Correct usage with contract parameters
         let initPkg = initOf TestParams(42);
         let code = codeOf TestParams;
    }
}
