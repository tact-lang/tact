// Fuzz Test 4: Testing initOf with contract parameters

contract ParamContract(param: Int) {
    // Implicit empty init because contract parameters are used
}

contract CallerContract {
    receive() {
        // Initialize ParamContract with a parameter
        let s = initOf ParamContract(100);
        let _ = s.code; // force computation
        let _ = s.data;
    }
}
