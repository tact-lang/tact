contract ParamContract(param: Int) {}

contract TestParamInit {
    receive() {
         let pkg = initOf ParamContract(42);
    }
}
