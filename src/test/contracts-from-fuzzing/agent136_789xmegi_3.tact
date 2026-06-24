contract ParamContract {
    // persistent storage variable
    x: Int;
    init(param: Int) {
        self.x = param;
    }
    receive() {}
}

contract Caller {
    receive() {
        // Compute the state init of ParamContract with an argument
        let s = initOf ParamContract(123);
        // Also extract code cell to validate syntax
        let c = codeOf ParamContract;
    }
}
