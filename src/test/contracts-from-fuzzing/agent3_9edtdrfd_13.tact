contract TestAddress {
    receive() {
        // Obtain the contract's own address
        let addr: Address = myAddress();
        // Parse the standard address components
        let stdAddr: StdAddress = parseStdAddress(addr.asSlice());

        // Check that the workchain is 0 (common for basechain)
        if (stdAddr.workchain != 0) {
            throw(1);
        }
        
        // Forward the remaining value to the sender
        cashback(sender());
    }
}
