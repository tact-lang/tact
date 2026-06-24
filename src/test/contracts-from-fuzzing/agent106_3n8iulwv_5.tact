contract ParamContr(x: Int) {
    receive() {}
}

contract Test4 {
    receive() {
         let init_d = initOf ParamContr(55);
         let code_d = codeOf ParamContr;
    }
}
