contract ParamContract(foo: Int) {
    receive() {
         // Utilize initOf with contract parameters
         let s = initOf ParamContract(100);
         let addr = contractAddress(s);
    }
}

contract TestParam {
    init() {}
    receive() {
         // Testing cross-contract initOf call with a parameterized contract
         let s = initOf ParamContract(200);
         let addr = contractAddress(s);
    }
}
