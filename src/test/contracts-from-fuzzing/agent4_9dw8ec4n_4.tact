/* Test 1: Simple cross-contract initOf usage */

contract B {
    init(x: Int) {
        // simple initialization
    }
}

contract A {
    receive() {
        let s = initOf B(42);
        let addr1 = contractAddress(s);
        let addr2 = contractAddressExt(0, s.code, s.data);
        require(addr1 == addr2, "addresses mismatch");
    }
}
