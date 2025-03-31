contract Dummy {
    // Minimal dummy contract
    receive() {}
}

contract TestHasSameBasechain {
    // Test the hasSameBasechainAddress extension function
    // It compares the basechain address in the StateInit of Dummy with a given address
    fun test(a: Address) : Bool {
        let initDummy = initOf Dummy();
        return initDummy.hasSameBasechainAddress(a);
    }

    // Minimal receive function
    receive() {}
}
