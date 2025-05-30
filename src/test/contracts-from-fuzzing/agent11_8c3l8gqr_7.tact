// Test 7: Self-consistency of initOf. Two calls should produce the same initial state.
contract Consistent {
    init() {}

    get fun checkConsistency(): Int {
        let s1 = initOf Consistent();
        let s2 = initOf Consistent();
        let addr1 = contractAddress(s1);
        let addr2 = contractAddress(s2);
        // return 1 if addresses are equal, otherwise 0
        if (addr1 == addr2) { return 1; } else { return 0; }
    }
}
