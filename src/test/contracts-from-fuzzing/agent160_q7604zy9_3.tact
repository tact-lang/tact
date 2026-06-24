contract ParamContract(param: Int) {
    // Contract with a parameter only, no init() function permitted
}

contract TestParam {
    init() {}
    
    receive() {
        let state = initOf ParamContract(123);
        let code = codeOf ParamContract;
        // Use the values in a dummy condition
        if (state.data == code) { return; }
    }
}
