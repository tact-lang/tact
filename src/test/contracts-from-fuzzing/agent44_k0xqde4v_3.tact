contract Gamma {
    init() {}
    receive() {}
}

contract Beta {
    fun checkGamma() : Bool {
        let pkg: StateInit = initOf Gamma();
        let addr1: Address = contractAddress(pkg);
        let addr2: Address = contractAddressExt(0, pkg.code, pkg.data);
        return addr1 == addr2;
    }
    init() {}
    receive() {}
}

contract Alpha {
    fun checkChain() : Bool {
        let pkgBeta: StateInit = initOf Beta();
        let pkgGamma: StateInit = initOf Gamma();
        // The addresses of Beta and Gamma should differ
        let addrBeta: Address = contractAddress(pkgBeta);
        let addrGamma: Address = contractAddress(pkgGamma);
        return addrBeta != addrGamma;
    }
    init() {}
    receive() {}
}
