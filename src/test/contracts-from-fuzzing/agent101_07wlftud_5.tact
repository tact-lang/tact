contract ParamContract(val: Int) {}

contract TestParamContract {
    init() {}
    
    receive() {
        // Valid usage: use contract parameters
        let s = initOf ParamContract(100);
        let c = codeOf ParamContract;
    }
}
