/* Test 6: Cross-checking current contract address using initOf and myAddress */

contract SelfAddress {
    // No init function declared, so implicit empty init is used
    get fun checkAddress(): Int {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf SelfAddress());
        // Return 1 if addresses match, 0 otherwise
        return (addr1 == addr2) ? 1 : 0;
    }
}
