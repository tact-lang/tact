contract TestExtensions {
    // Test the extension function hasSameBasechainAddress
    // Here we simulate a call by using the contract's own computed basechain address as the 'sender'.
    fun testHasSameBasechainAddress() : Bool {
        let initVal = initOf TestExtensions();
        let baseAddr = contractAddress(initVal);
        return initVal.hasSameBasechainAddress(baseAddr);
    }

    // Test Address.toString extension function
    fun testToString() : Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s: String = a.toString();
        return (s == "EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    }

    // Test Address.asSlice extension function compare
    fun testAsSlice() : Bool {
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s1: Slice = beginCell().storeAddress(a).asSlice();
        let s2: Slice = a.asSlice();
        return s1 == s2;
    }
}
