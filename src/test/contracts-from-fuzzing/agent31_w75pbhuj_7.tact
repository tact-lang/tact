contract TestAddressConstant {
    // This function uses the compile-time function 'address' to create an Address constant
    // and then returns the number of bits in its underlying slice. While the actual number of
    // bits may vary, this test verifies that the expression is evaluated at compile-time.
    get fun getAddressBits(): Int {
         let addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
         let s: Slice = addr.asSlice();
         return s.bits();
    }
}
