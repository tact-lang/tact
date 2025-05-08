contract ParamContract(x: Int) {
    // Contract with a parameter. We don't define an init() because contract parameters are used.
    receive() {
         // Use initOf with an argument matching the contract parameter type
         let si = initOf ParamContract(42);
         // Also test codeOf
         let code = codeOf ParamContract;
    }
}
