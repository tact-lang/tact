contract A {
    init(x: Int) {}
}

contract B {
    fun testInit() : Int {
         let s = initOf A(42);
         // Simple usage of initOf: compute contractAddress and check consistency
         let addr1 = contractAddress(s);
         let addr2 = contractAddress(s);
         return addr1 == addr2 ? 1 : 0;
    }

    receive() {
         self.testInit();
    }
}
