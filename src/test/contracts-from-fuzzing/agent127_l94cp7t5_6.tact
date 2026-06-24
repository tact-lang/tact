contract ParamCont(val: Int) {}

contract TestParamContValid {
    receive() {
        // Valid usage with a contract having parameters
        let si = initOf ParamCont(777);
        let co = codeOf ParamCont;
    }
}
