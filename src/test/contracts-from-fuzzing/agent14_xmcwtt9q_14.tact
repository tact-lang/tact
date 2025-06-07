contract TestHash {
    init() {}
    receive() {}
}

contract UsingHash {
    receive() {
        let initPkg = initOf TestHash();
        let h = contractHash(initPkg.code, initPkg.data);
        let addr = newAddress(0, h);
        // contractAddress returns the address computed for the basechain (chain 0) using the state init package.
        require(addr == contractAddress(initPkg), "Hash mismatch");
    }
}
