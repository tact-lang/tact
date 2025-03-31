/* Test Snippet 7: Using an invalid chain ID in contractAddressExt with initOf
   According to documentation, only chain IDs -1 and 0 are allowed at compile-time.
   This snippet attempts to use chain ID 1, which should cause a compile-time error.
*/

contract WrongChain {
    init() {
        let initPkg = initOf WrongChain();
        // Using invalid chain ID: 1 (only -1 and 0 are valid)
        let wrongAddr = contractAddressExt(1, initPkg.code, initPkg.data);
    }
    
    receive() {}
}
