contract ParamF(s: String) {}

contract CallParamF {
    receive() {
        let s: StateInit = initOf ParamF("Hello");
    }
}
