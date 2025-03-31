contract TestDynamicChain {
    // This function uses a runtime (non-constant) chain parameter. According to documentation,
    // newAddress() should only accept constant 0 or -1 if evaluable at compile-time, but here we test
    // with a dynamic value to see if the compiler allows it.
    fun test(chain: Int): Address {
       return newAddress(chain, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}
