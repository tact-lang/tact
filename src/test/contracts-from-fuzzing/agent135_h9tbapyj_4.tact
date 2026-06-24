contract ParamContract(param1: Int, param2: Int) {
    // No explicit init, use contract parameters
    receive() {}
}

contract TestParamInit {
    receive() {
        let s: StateInit = initOf ParamContract(42, 100);
    }
}