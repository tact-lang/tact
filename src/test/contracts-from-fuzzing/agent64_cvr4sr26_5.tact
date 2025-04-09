contract ParamTest(param: Int) {
    receive() {}
}

contract Test {
    receive() {
         let s = initOf ParamTest(42);
         let c = codeOf ParamTest;
    }
}
