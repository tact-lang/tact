contract SelfReferencing {
    // Attempt to get its own StateInit
    inline fun selfInit() : StateInit {
        return initOf SelfReferencing();
    }

    receive() {
        let initPkg = self.selfInit();
        let addr = contractAddress(initPkg);
        // Compare computed address with runtime myAddress()
        require(addr == myAddress(), "Self address mismatch");
    }
}
