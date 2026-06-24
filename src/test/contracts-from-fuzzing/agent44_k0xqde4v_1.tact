contract Child {
    init() {}
}

contract Parent {
    fun test() : Bool {
         let initPkg: StateInit = initOf Child();
         let addr1: Address = contractAddress(initPkg);
         let addr2: Address = contractAddressExt(0, initPkg.code, initPkg.data);
         return addr1 == addr2;
    }

    // a minimal receive function is needed to make the contract deployable
    receive() {}
}
