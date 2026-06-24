contract ParamCon(param: Int) {
    receive() {}
}

contract TestD {
    receive() {
         let s = initOf ParamCon(42);
         let c = codeOf ParamCon;
    }
}
