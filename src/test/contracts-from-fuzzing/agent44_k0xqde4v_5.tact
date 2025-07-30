contract ParamContract(param: Int) {
    // A simple contract with a parameter, no explicit init()
    receive() {}
}

contract Container {
    // This function verifies that different initialization parameters result in different addresses
    fun testParam() : Bool {
        let pkg1 = initOf ParamContract(7);
        let pkg2 = initOf ParamContract(8);
        return contractAddress(pkg1) != contractAddress(pkg2);
    }

    init() {}
    receive() {}
}
