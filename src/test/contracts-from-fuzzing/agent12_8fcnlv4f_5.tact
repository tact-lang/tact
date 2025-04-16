const testAddr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

contract TestAddr() {
    get fun getAddr(): Address {
         return testAddr;
    }
    
    // Dummy receiver to enforce full compilation
    receive() {}
}
