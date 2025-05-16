contract A {
    init(x: Int, y: Int) {
    }
}

contract Test {
    fun test(): Address {
        let initPkg = initOf A(42, 100);
        return contractAddress(initPkg);
    }
}
