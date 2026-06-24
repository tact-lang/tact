contract DoubleSelf {
    dummy: Int;
    init() {
        // Call initOf twice on the same contract to compute its initial state
        let initA = initOf DoubleSelf();
        let addrA = contractAddress(initA);
        let initB = initOf DoubleSelf();
        let addrB = contractAddress(initB);
        // For testing purposes, we perform a dummy assignment
        // Note: addrA and addrB should be equivalent if computed with constant expressions
        self.dummy = 1;
    }
    get fun getDummy(): Int { return self.dummy; }
}
