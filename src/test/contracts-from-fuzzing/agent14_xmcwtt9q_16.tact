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

contract TestChainAddresses {
    init() {}
    receive() {
        let pkg = initOf TestHash();
        let addr0 = contractAddressExt(0, pkg.code, pkg.data);
        let addrMaster = contractAddressExt(-1, pkg.code, pkg.data);
        // Expect addresses to differ because chain IDs differ (0 is basechain, -1 is masterchain)
        require(addr0 != addrMaster, "Chain address mismatch: basechain and masterchain should differ");
    }
}

contract Parametrized(x: Int, y: Int) {
    receive() {}
}

contract CallerParam {
    receive() {
        // Using initOf with contract parameters
        let pkg = initOf Parametrized(10, 20);
        // Compute address using the pkg
        let addr = contractAddress(pkg);
        // Recompute address using contractAddressExt for consistency check
        let addr2 = contractAddressExt(0, pkg.code, pkg.data);
        require(addr == addr2, "Address computation mismatch for parameterized contract");
    }
}
