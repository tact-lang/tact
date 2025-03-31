contract TestHasSameBasechain {
    // This contract tests the extension function hasSameBasechainAddress
    // to verify that the sender matches the contract's basechain address.
    init() {}
    get fun testSameBasechain(): Bool {
        let initPkg: StateInit = initOf TestHasSameBasechain();
        // Checks if the sender is the basechain address of the contract
        return initPkg.hasSameBasechainAddress(myAddress());
    }
}

// Additional contract: TestForceBasechainBehavior ensures that forceBasechain
// throws an error when used with a non-basechain (masterchain) address and does not affect basechain addresses.
contract TestForceBasechainBehavior {
    receive() {
        // Create a basechain address using chain ID 0
        let baseAddr = newAddress(0, 0xabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef);
        // This should not throw
        forceBasechain(baseAddr);
        
        // Create a masterchain address using chain ID -1
        let masterAddr = newAddress(-1, 0xabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef);
        let caught: Bool = false;
        try {
            forceBasechain(masterAddr);
        } catch (exitCode) {
            caught = (exitCode == 138);
        }
        require(caught, "ForceBasechainBehavior");
    }
}
