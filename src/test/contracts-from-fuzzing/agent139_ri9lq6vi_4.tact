contract ParamContract(val: Int) {}

contract CallerParam {
    receive() {
        let s = initOf ParamContract(10);
    }
}
