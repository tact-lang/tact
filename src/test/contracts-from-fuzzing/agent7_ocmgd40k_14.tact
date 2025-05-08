contract AddressConsistency {
    receive() {
        // Obtain the runtime address of the current contract
        let addrRuntime: Address = myAddress();
        // Compute the initial state and then the contract address from it
        let addrInit: Address = contractAddress(initOf AddressConsistency());
        // Dump whether the runtime address equals the initial address; expected to be true for workchain 0
        dump(addrRuntime == addrInit);
    }
}
