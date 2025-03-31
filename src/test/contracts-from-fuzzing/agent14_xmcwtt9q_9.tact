contract CommaParamContract {
    init(x: Int, y: Int) {}
    receive() {}
}

contract UsingTrailingComma {
    receive() {
        // A trailing comma is allowed.
        let initPkg = initOf CommaParamContract(42, 100,);
        let addr = contractAddress(initPkg);
        // No runtime check, just compute address
    }
}
