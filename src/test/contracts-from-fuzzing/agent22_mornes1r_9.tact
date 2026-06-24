contract ParamTester(param: Int) {
    // A contract with a contract parameter; no init() function declared
    receive() {}
}

contract UseParamTester {
    receive() {
        // Test using initOf with a parameterized contract, with a trailing comma
        let pkg = initOf ParamTester(456,);
        // Retrieve the code cell using codeOf
        let codePkg = codeOf ParamTester;
        
        // Force evaluation by assigning to dummy variables
        let _dummy1 = pkg.code;
        let _dummy2 = pkg.data;
        let _dummy3 = codePkg;
    }
}
