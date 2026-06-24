contract A {
    init(x: Int) {}
}

contract B {
    fun testA() : Address {
        let si = initOf A(42);
        return contractAddress(si);
    }
}
